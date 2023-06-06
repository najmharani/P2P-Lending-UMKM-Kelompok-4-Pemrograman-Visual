import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pengembalian {
  int idPengembalian;
  int idPeminjaman;
  String batasWaktuPengembalian;
  String waktuPengembalian;
  int idTransaksi;

  Pengembalian({
    required this.idPengembalian,
    required this.idPeminjaman,
    required this.batasWaktuPengembalian,
    required this.waktuPengembalian,
    required this.idTransaksi,
  });
}

class UmkmCubit extends Cubit<Pengembalian> {
  UmkmCubit()
      : super(Pengembalian(
          idPengembalian: 0,
          idPeminjaman: 0,
          batasWaktuPengembalian: "",
          waktuPengembalian: "",
          idTransaksi: 0,
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(Pengembalian(
      idPengembalian: json["idPengembalian"],
      idPeminjaman: json["idPeminjaman"],
      batasWaktuPengembalian: json["batasWaktuPengembalian"],
      waktuPengembalian: json["waktuPengembalian"],
      idTransaksi: json["idTransaksi"],
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
