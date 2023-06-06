import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Chat {
  int idPesan;
  int idInvestasi;
  String isiPesan;
  String waktuTerkirim;
  String statusPengiriman;

  Chat({
    required this.idPesan,
    required this.idInvestasi,
    required this.isiPesan,
    required this.waktuTerkirim,
    required this.statusPengiriman,
  });
}

class UmkmCubit extends Cubit<Chat> {
  UmkmCubit()
      : super(Chat(
          idPesan: 0,
          idInvestasi: 0,
          isiPesan: "",
          waktuTerkirim: "",
          statusPengiriman: "",
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(Chat(
      idPesan: json["idPesan"],
      idInvestasi: json["idInvestasi"],
      isiPesan: json["isiPesan"],
      waktuTerkirim: json["waktuTerkirim"],
      statusPengiriman: json["statusPengiriman"],
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
