import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:p2plending_umkm/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/borrower/navigation_borrower.dart';
import 'package:p2plending_umkm/landing_page/pages/form_pemilik.dart';
import 'package:p2plending_umkm/models/Umkm.model.dart';
import 'package:p2plending_umkm/models/User.model.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      theme: ThemeData(
        primarySwatch: primary,
        fontFamily: 'lexend',
      ),
      home: RegisterBorrowerNextPage(),
    );
  }
}

class RegisterBorrowerNextPage extends StatefulWidget {
  const RegisterBorrowerNextPage();

  @override
  State<RegisterBorrowerNextPage> createState() =>
      _RegisterBorrowerNextPageState();
}

class _RegisterBorrowerNextPageState extends State<RegisterBorrowerNextPage> {
  final namaUmkmController = TextEditingController();
  final alamatUmkmController = TextEditingController();
  final jenisUsahaController = TextEditingController();
  final tahunBerdiriController = TextEditingController();
  final deskripsiController = TextEditingController();
  late int idTipe;

  List<String> alamatProvinsi = [
  'Aceh',
  'Sumatra Utara',
  'Sumatra Barat',
  'Riau',
  'Jambi',
  'Sumatra Selatan',
  'Bengkulu',
  'Lampung',
  'Kepulauan Bangka Belitung',
  'Kepulauan Riau',
  'Daerah Khusus Ibukota Jakarta',
  'Jawa Barat',
  'Jawa Tengah',
  'Daerah Istimewa Yogyakarta',
  'Jawa Timur',
  'Banten',
  'Bali',
  'Nusa Tenggara Barat',
  'Nusa Tenggara Timur',
  'Kalimantan Barat',
  'Kalimantan Tengah',
  'Kalimantan Selatan',
  'Kalimantan Timur',
  'Kalimantan Utara',
  'Sulawesi Utara',
  'Sulawesi Tengah',
  'Sulawesi Selatan',
  'Sulawesi Tenggara',
  'Gorontalo',
  'Sulawesi Barat',
  'Maluku',
  'Maluku Utara',
  'Papua',
  'Papua Barat',
  'Papua Selatan',
  'Papua Tengah',
  'Papua Pegunungan',
  'Papua Barat Daya',
];


  String selectedProvinsi = 'Jawa Barat'; // Default selected province

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

  Future<void> insertBorrower(
      String namaUmkm,
      String alamatUmkmDetail,
      String jenisUsaha,
      String tahunBerdiri,
      String deskripsi,
      String npwp,
      String suratIzinUsaha,
      String laporanKeuangan,
      String fotoUmkm) async {
    final url = 'http://127.0.0.1:8000/tambah_umkm/';

    final Map<String, dynamic> userData = {
      "ID_BORROWER": 0,
      "nama_umkm": namaUmkm,
      "alamat_umkm_provinsi": selectedProvinsi,
      "alamat_umkm_detail": alamatUmkmDetail,
      "jenis_usaha": jenisUsaha,
      "tahun_berdiri": tahunBerdiri,
      "surat_izin_usaha": suratIzinUsaha,
      "npwp": npwp,
      "laporan_keuangan": laporanKeuangan,
      "foto_umkm": fotoUmkm,
      "rating": "",
      "omzet": 0,
      "deskripsi_umkm": deskripsi,
      "id_pemilik_umkm": 0
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
      borrowerRegister();
      print('Borrower berhasil ditambahkan');
    } else {
      // Error occurred while inserting Borrower
      print('Error saat menambahkan borrower');
    }
  }

  void borrowerRegister() {
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
          "Berhasil Membuat Akun Borrower",
          style: TextStyle(
            fontFamily: "lexend",
          ),
        ),
      ),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return PemilikUMKMForm();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form UMKM'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: namaUmkmController,
              decoration: InputDecoration(
                labelText: 'Nama UMKM',
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedProvinsi,
              onChanged: (newValue) {
                setState(() {
                  selectedProvinsi = newValue!;
                });
              },
              items: alamatProvinsi.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Provinsi UMKM',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: alamatUmkmController,
              decoration: InputDecoration(
                labelText: 'Alamat UMKM',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: jenisUsahaController,
              decoration: InputDecoration(
                labelText: 'Jenis UMKM',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: tahunBerdiriController,
              decoration: InputDecoration(
                labelText: 'Tahun Berdiri',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: deskripsiController,
              decoration: InputDecoration(
                labelText: 'Deskripsi UMKM',
              ),
            ),
            SizedBox(height: 16.0),
            buildUploadButton('NPWP', Icons.attach_file),
            SizedBox(height: 8.0),
            buildUploadButton('Izin Usaha', Icons.attach_file),
            SizedBox(height: 8.0),
            buildUploadButton('Laporan Keuangan', Icons.attach_file),
            SizedBox(height: 8.0),
            buildUploadButton('Foto UMKM', Icons.attach_file),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(200.0, 40.0)),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  insertBorrower(
                      namaUmkmController.text,
                      alamatUmkmController.text,
                      jenisUsahaController.text,
                      tahunBerdiriController.text,
                      deskripsiController.text,
                      "",
                      "",
                      "",
                      "");
                });
              },
            ),
          ],
        ),
      ),
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
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 40.0),
          ),
        ),
      ],
    );
  }
}