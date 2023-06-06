import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Investasi {
  int idInvestasi;
  int idUser;
  int idPeminjaman;
  int bagiHasilDiterima;

  Investasi({
    required this.idInvestasi,
    required this.idUser,
    required this.idPeminjaman,
    required this.bagiHasilDiterima,
  });
}

class UmkmCubit extends Cubit<Investasi> {
  UmkmCubit()
      : super(Investasi(
          idInvestasi: 0,
          idUser: 0,
          idPeminjaman: 0,
          bagiHasilDiterima: 0,
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(Investasi(
      idInvestasi: json["idInvestasi"],
      idUser: json["idUser"],
      idPeminjaman: json["idPeminjaman"],
      bagiHasilDiterima: json["bagiHasilDiterima"],
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
