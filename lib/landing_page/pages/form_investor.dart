import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:p2plending_umkm/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/investor/navigation_investor.dart';
import 'package:p2plending_umkm/models/Investor.model.dart';
import 'package:p2plending_umkm/models/User.model.dart';

void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: RegisterInvestorNextPage(),
    );
  }
}

class RegisterInvestorNextPage extends StatefulWidget {
  const RegisterInvestorNextPage();

  @override
  State<RegisterInvestorNextPage> createState() =>
      _RegisterInvestorNextPageState();
}

class _RegisterInvestorNextPageState extends State<RegisterInvestorNextPage> {
  final namaController = TextEditingController();
  final tglLahirController = TextEditingController();
  final genderontroller = TextEditingController();
  final nikController = TextEditingController();
  late int idTipe;

  Future<void> updateUserIdTipe(int idUser, int idTipe) async {
    final Map<String, dynamic> userData = {
      'email': "",
      'password': "",
      'no_telp': "",
      'foto_profil': "",
      'saldo': 0,
      'tipe_user': "",
      'id_tipe_user': idTipe,
    };

    print('id tipe: $idTipe');

    final response = await http.patch(
      Uri.parse("http://127.0.0.1:8000/update_user/$idUser"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('idTipeUser', idTipe);
    } else {
      print('Gagal patch ${response.statusCode}');
    }
  }

  Future<void> insertInvestor(
      String namaLengkap,
      String tglLahir,
      String jenisKelamin,
      String nik,
      String fotoKtp,
      String fotoInvestor) async {
    final url = 'http://127.0.0.1:8000 /tambah_investor/';

    final Map<String, dynamic> userData = {
      "nama_lengkap": namaLengkap,
      "tgl_lahir": tglLahir,
      "jenis_kelamin": jenisKelamin,
      "nik": nik,
      "foto_ktp": fotoKtp,
      "foto_investor": fotoInvestor,
      "aset": 0
    };

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(userData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // User inserted successfully
      idTipe = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('idTipeUser', idTipe);
      updateUserIdTipe(prefs.getInt('idUser')!, idTipe);
      print('$idTipe');
      investorRegister();
      print('Investor berhasil ditambahkan');
    } else {
      // Error occurred while inserting Investor
      print('Error saat menambahkan investor');
    }
  }

  void investorRegister() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 97, 175),
        content: Text(
          "Berhasil Membuat Akun Investor",
          style: TextStyle(
            fontFamily: "lexend",
          ),
        ),
      ),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return InvestorApp();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: tglLahirController,
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir',
              ),
            ),
            SizedBox(height: 16.0),
            buildGenderDropdown(),
            SizedBox(height: 16.0),
            TextField(
              controller: nikController,
              decoration: InputDecoration(
                labelText: 'Nomor NIK',
              ),
            ),
            SizedBox(height: 16.0),
            buildUploadButton('Foto KTP', Icons.attach_file),
            SizedBox(height: 8.0),
            buildUploadButton('Foto Pemilik', Icons.attach_file),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize:
                    MaterialStateProperty.all(Size(double.infinity, 40.0)),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  insertInvestor(namaController.text, tglLahirController.text,
                      genderontroller.text, nikController.text, "", "");
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Jenis Kelamin',
      ),
      items: <String>['Laki-Laki', 'Perempuan'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        genderontroller.text = newValue!;
      },
    );
  }

  Widget buildUploadButton(String text, IconData icon) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        ElevatedButton.icon(
          icon: Icon(icon),
          label: Text(
            'Upload',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            // Implementasi logika upload di sini
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 40.0),
          ),
        ),
      ],
    );
  }
}
