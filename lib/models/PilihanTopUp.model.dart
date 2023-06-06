import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PilihanTopUp {
  int idPilihan;
  String namaBank;
  int biayaAdmin;
  String virtualAccount;
  String keterangan;
  String langkahTopUp;

  PilihanTopUp({
    required this.idPilihan,
    required this.namaBank,
    required this.biayaAdmin,
    required this.virtualAccount,
    required this.keterangan,
    required this.langkahTopUp,
  });
}

class UmkmCubit extends Cubit<PilihanTopUp> {
  UmkmCubit()
      : super(PilihanTopUp(
          idPilihan: 0,
          namaBank: "",
          biayaAdmin: 0,
          virtualAccount: "",
          keterangan: "",
          langkahTopUp: "",
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(PilihanTopUp(
      idPilihan: json["idPilihan"],
      namaBank: json["namaBank"],
      biayaAdmin: json["biayaAdmin"],
      virtualAccount: json["virtualAccount"],
      keterangan: json["keterangan"],
      langkahTopUp: json["langkahTopUp"],
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
