import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(BorrowerApp());
}

class BorrowerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Borrower',
      debugShowCheckedModeBanner: false,
      home: FormPengajuanPinjaman(),
    );
  }
}

class FormPengajuanPinjaman extends StatelessWidget {
  // final UserType userType;

  // const RegisterPage({required this.userType});

  Future<void> insertPeminjaman(
      int jumlahPinjaman,
      int bagiHasil,
      String tenor,
      String waktuPengajuan,
      String jatuhTempo,
      int penghasilanPerBulan,
      String statusPinjaman) async {
    final url = 'http://127.0.0.1:8000 /tambah_peminjaman/';

    final Map<String, dynamic> userData = {
      "ID_PEMINJAMAN": 0,
      "jumlah_pinjaman": 0,
      "status_pinjaman": "Pengajuan",
      "status_pengajuan": "Pengajuan",
      "waktu_pengajuan": "",
      "waktu_pendanaan": "",
      "jatuh_tempo": "",
      "bagi_hasil": 0,
      "tenor": "",
      "penghasilan_perbulan": 0,
      "jumlah_angsuran": jumlahPinjaman / int.parse(tenor),
      "sisa_tenor": tenor,
      "nilai_rating": "",
      "id_borrower": 0
    };

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(userData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // User inserted successfully
      print('Investor berhasil ditambahkan');
    } else {
      // Error occurred while inserting Investor
      print('Error saat menambahkan investor');
    }
  }

  @override
  Widget build(BuildContext context) {
    final jumlahController = TextEditingController();
    final bagiController = TextEditingController();
    final tenorUsahaController = TextEditingController();
    final penghasilanController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Pengajuan Pinjaman"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: jumlahController,
              decoration: InputDecoration(
                labelText: 'Jumlah Pinjaman',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: bagiController,
              decoration: InputDecoration(
                labelText: 'Bagi Hasil',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: tenorUsahaController,
              decoration: InputDecoration(
                labelText: 'Tenor',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: penghasilanController,
              decoration: InputDecoration(
                labelText: 'Penghasilan per Bulan',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Simpan'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
