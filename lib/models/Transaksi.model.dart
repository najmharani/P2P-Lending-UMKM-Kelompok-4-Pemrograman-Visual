import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Transaksi {
  int idTransaksi;
  int idUser;
  int jumlahTransaksi;
  String jenisTransaksi;
  String tanggalWaktuTransaksi;
  String detailTransaksi;

  Transaksi({
    required this.idTransaksi,
    required this.idUser,
    required this.jumlahTransaksi,
    required this.jenisTransaksi,
    required this.tanggalWaktuTransaksi,
    required this.detailTransaksi,
  });
}

class UmkmCubit extends Cubit<Transaksi> {
  UmkmCubit()
      : super(Transaksi(
          idTransaksi: 0,
          idUser: 0,
          jumlahTransaksi: 0,
          jenisTransaksi: "",
          tanggalWaktuTransaksi: "",
          detailTransaksi: "",
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(Transaksi(
      idTransaksi: json["idTransaksi"],
      idUser: json["idUser"],
      jumlahTransaksi: json["jumlahTransaksi"],
      jenisTransaksi: json["jenisTransaksi"],
      tanggalWaktuTransaksi: json["tanggalWaktuTransaksi"],
      detailTransaksi: json["detailTransaksi"],
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
