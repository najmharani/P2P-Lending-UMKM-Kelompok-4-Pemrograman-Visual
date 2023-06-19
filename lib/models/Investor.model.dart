import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Investor {
  int idInvestor;
  String namaLengkap;
  String tanggalLahir;
  String jenisKelamin;
  String nik;
  String fotoKtp;
  String fotoPemilik;
  int aset;

  Investor({
    required this.idInvestor,
    required this.namaLengkap,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.nik,
    required this.fotoKtp,
    required this.fotoPemilik,
    required this.aset,
  });
}

class InvestorCubit extends Cubit<Investor> {
  InvestorCubit()
      : super(Investor(
          idInvestor: 0,
          namaLengkap: "",
          tanggalLahir: "",
          jenisKelamin: "",
          nik: "",
          fotoKtp: "",
          fotoPemilik: "",
          aset: 0,
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(Investor(
      idInvestor: json["idInvestor"],
      namaLengkap: json["namaLengkap"],
      tanggalLahir: json["tanggalLahir"],
      jenisKelamin: json["jenisKelamin"],
      nik: json["nik"],
      fotoKtp: json["fotoKtp"],
      fotoPemilik: json["fotoPemilik"],
      aset: int.parse(json["aset"]),
    ));
  }

  void fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int idInvestor = prefs.getInt('idTipeUser')!;
    String url = "http://127.0.0.1:8000/get_investor/${idInvestor}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
