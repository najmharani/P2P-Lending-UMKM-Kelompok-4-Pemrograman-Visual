import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PemilikUmkm {
  int idPemilik;
  String namaLengkap;
  String tanggalLahir;
  String jenisKelamin;
  String nik;
  String fotoKtp;
  String fotoPemilik;

  PemilikUmkm({
    required this.idPemilik,
    required this.namaLengkap,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.nik,
    required this.fotoKtp,
    required this.fotoPemilik,
  });
}

class UmkmCubit extends Cubit<PemilikUmkm> {
  UmkmCubit()
      : super(PemilikUmkm(
          idPemilik: 0,
          namaLengkap: "",
          tanggalLahir: "",
          jenisKelamin: "",
          nik: "",
          fotoKtp: "",
          fotoPemilik: "",
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(PemilikUmkm(
      idPemilik: json["idPemilik"],
      namaLengkap: json["namaLengkap"],
      tanggalLahir: json["tanggalLahir"],
      jenisKelamin: json["jenisKelamin"],
      nik: json["nik"],
      fotoKtp: json["fotoKtp"],
      fotoPemilik: json["fotoPemilik"],
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
