import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class FormPengajuanPinjaman extends StatefulWidget {
  const FormPengajuanPinjaman();

  @override
  State<FormPengajuanPinjaman> createState() => _FormPengajuanPinjamanState();
}

class _FormPengajuanPinjamanState extends State<FormPengajuanPinjaman> {
  Future<void> insertPeminjaman(int jumlahPinjaman, int bagiHasil, String tenor,
      int penghasilanPerBulan) async {
    final url = 'http://127.0.0.1:8000 /tambah_peminjaman/';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int idTipeUser = prefs.getInt('idTipeUser')!;
    String datetime = DateTime.now().toString();
    print(idTipeUser);

    final Map<String, dynamic> userData = {
      "ID_PEMINJAMAN": 0,
      "jumlah_pinjaman": jumlahPinjaman,
      "status_pinjaman": "Pengajuan",
      "status_pengajuan": "Pengajuan",
      "waktu_pengajuan": datetime,
      "waktu_pendanaan": "",
      "jatuh_tempo": "",
      "bagi_hasil": bagiHasil,
      "tenor": tenor,
      "penghasilan_perbulan": penghasilanPerBulan,
      "jumlah_angsuran": jumlahPinjaman * (bagiHasil / 100) / int.parse(tenor),
      "sisa_tenor": tenor,
      "nilai_rating": "",
      "id_borrower": idTipeUser,
    };

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(userData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // User inserted successfully
      print('Peminjaman berhasil ditambahkan');
    } else {
      // Error occurred while inserting Investor
      print('Error saat menambahkan peminjaman');
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
                labelText: 'Bagi Hasil (%)',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: tenorUsahaController,
              decoration: InputDecoration(
                labelText: 'Tenor',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: penghasilanController,
              decoration: InputDecoration(
                labelText: 'Penghasilan per Bulan',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Simpan'),
              onPressed: () {
                setState(() {
                  insertPeminjaman(
                      int.parse(jumlahController.text),
                      int.parse(bagiController.text),
                      tenorUsahaController.text,
                      int.parse(penghasilanController.text));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
