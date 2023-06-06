import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BankAccount {
  int idUser;
  String namaBank;
  String noRekening;
  String namaRekening;

  BankAccount({
    required this.idUser,
    required this.namaBank,
    required this.noRekening,
    required this.namaRekening,
  });
}

class UmkmCubit extends Cubit<BankAccount> {
  UmkmCubit()
      : super(BankAccount(
          idUser: 0,
          namaBank: "",
          noRekening: "",
          namaRekening: "",
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(BankAccount(
      idUser: json["idUser"],
      namaBank: json["namaBank"],
      noRekening: json["noRekening"],
      namaRekening: json["namaRekening"],
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
