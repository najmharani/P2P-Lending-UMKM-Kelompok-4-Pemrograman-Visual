import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Umkm {
  int idBorrower;
  int idPemilikUmkm;
  String namaUmkm;
  String deskripsiUmkm;
  String alamatUmkmProvinsi;
  String alamatUmkmDetail;
  String jenisUsaha;
  String tahunBerdiri;
  String suratIzinUsaha;
  String npwp;
  String laporanKeuangan;
  String fotoUmkm;
  String rating;
  int omzet;

  Umkm({
    required this.idBorrower,
    required this.idPemilikUmkm,
    required this.namaUmkm,
    required this.deskripsiUmkm,
    required this.alamatUmkmProvinsi,
    required this.alamatUmkmDetail,
    required this.jenisUsaha,
    required this.tahunBerdiri,
    required this.suratIzinUsaha,
    required this.npwp,
    required this.laporanKeuangan,
    required this.fotoUmkm,
    required this.rating,
    required this.omzet,
  });
}

class UmkmCubit extends Cubit<Umkm> {
  UmkmCubit()
      : super(Umkm(
          idBorrower: 0,
          idPemilikUmkm: 0,
          namaUmkm: "",
          deskripsiUmkm: "",
          alamatUmkmProvinsi: "",
          alamatUmkmDetail: "",
          jenisUsaha: "",
          tahunBerdiri: "",
          suratIzinUsaha: "",
          npwp: "",
          laporanKeuangan: "",
          fotoUmkm: "",
          rating: "",
          omzet: 0,
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(Umkm(
      idBorrower: json["idBorrower"],
      idPemilikUmkm: json["idPemilikUmkm"],
      namaUmkm: json["namaUmkm"],
      deskripsiUmkm: json["deskripsiUmkm"],
      alamatUmkmProvinsi: json["alamatUmkmProvinsi"],
      alamatUmkmDetail: json["alamatUmkmDetail"],
      jenisUsaha: json["jenisUsaha"],
      tahunBerdiri: json["tahunBerdiri"],
      suratIzinUsaha: json["suratIzinUsaha"],
      npwp: json["npwp"],
      laporanKeuangan: json["laporanKeuangan"],
      fotoUmkm: json["fotoUmkm"],
      rating: json["rating"],
      omzet: json["omzet"],
    ));
  }

  void fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int idTipeUser = prefs.getInt('idTipeUser')!;
    String url = "http://127.0.0.1:8000/get_umkm/${idTipeUser}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
