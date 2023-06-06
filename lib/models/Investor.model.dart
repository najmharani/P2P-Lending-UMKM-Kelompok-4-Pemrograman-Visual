import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  int idUser;
  String email;
  String password;
  String noTelp;
  String fotoProfil;
  int saldo;
  String tipeUser;
  int idTipeUser;

  User({
    required this.idUser,
    required this.email,
    required this.password,
    required this.noTelp,
    required this.fotoProfil,
    required this.saldo,
    required this.tipeUser,
    required this.idTipeUser,
  });
}

class UserCubit extends Cubit<User> {
  String email = "";
  String password = "";

  UserCubit()
      : super(User(
          idUser: 0,
          email: "",
          password: "",
          noTelp: "",
          fotoProfil: "",
          saldo: 0,
          tipeUser: "",
          idTipeUser: 0,
        )) {
    fetchData(email, password);
  }

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(User(
      idUser: json["idUser"],
      email: json["email"],
      password: json["password"],
      noTelp: json["noTelp"],
      fotoProfil: json["fotoProfil"],
      saldo: json["saldo"],
      tipeUser: json["tipeUser"],
      idTipeUser: json["idTipeUser"],
    ));
  }

  void fetchData(String email, String password) async {
    this.email = email;
    this.password = password;
    String url =
        "http://127.0.0.1:8000/login_auth/email=$email&password=$password";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
