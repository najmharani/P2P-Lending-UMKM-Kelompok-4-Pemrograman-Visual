import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final String url_login = "http://localhost:8000/login";

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
        ));

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

  // void fetchData(String email, String password) async {
  //   this.email = email;
  //   this.password = password;
  //   String url =
  //       "http://127.0.0.1:8000/login_auth/email=$email&password=$password";

  //   print(url);
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     setFromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Gagal load');
  //   }
  // }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    String dataUser = prefs.getString('data_user').toString();
    Map<String, dynamic> decodedToken = json.decode(dataUser);

    emit(User(
      idUser: decodedToken["idUser"],
      email: decodedToken["email"],
      password: decodedToken["password"],
      noTelp: decodedToken["noTelp"],
      fotoProfil: decodedToken["fotoProfil"],
      saldo: decodedToken["saldo"],
      tipeUser: decodedToken["tipeUser"],
      idTipeUser: decodedToken["idTipeUser"],
    ));
  }

  Future<void> saveUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(url_login),
      body: jsonEncode({
        'idUser': 0,
        'email': email,
        'password': password,
        'no_telp': '',
        'foto_profil': '',
        'tipe_user': '',
        'saldo': 0,
        'id_tipe_user': 0,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = responseData['data'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('data_user', token);

      Map<String, dynamic> decodedToken = token;

      emit(User(
        idUser: decodedToken["idUser"],
        email: decodedToken["email"],
        password: decodedToken["password"],
        noTelp: decodedToken["noTelp"],
        fotoProfil: decodedToken["fotoProfil"],
        saldo: decodedToken["saldo"],
        tipeUser: decodedToken["tipeUser"],
        idTipeUser: decodedToken["idTipeUser"],
      ));
    } else {
      print('Login failed with status code ${response.statusCode}');
    }
  }

  Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('data_user');

    emit(
      User(
        idUser: 0,
        email: "",
        password: "",
        noTelp: "",
        fotoProfil: "",
        saldo: 0,
        tipeUser: "",
        idTipeUser: 0,
      ),
    );
  }
}
