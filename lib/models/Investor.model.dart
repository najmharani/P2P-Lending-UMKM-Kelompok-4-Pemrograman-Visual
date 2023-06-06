import 'package:flutter_bloc/flutter_bloc.dart';
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
  int omzet;

  Investor({
    required this.idInvestor,
    required this.namaLengkap,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.nik,
    required this.fotoKtp,
    required this.fotoPemilik,
    required this.omzet,
  });
}

class UmkmCubit extends Cubit<Investor> {
  UmkmCubit()
      : super(Investor(
          idInvestor: 0,
          namaLengkap: "",
          tanggalLahir: "",
          jenisKelamin: "",
          nik: "",
          fotoKtp: "",
          fotoPemilik: "",
          omzet: 0,
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
      omzet: json["omzet"],
    ));
  }

  void fetchData() async {
    String url = "";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
