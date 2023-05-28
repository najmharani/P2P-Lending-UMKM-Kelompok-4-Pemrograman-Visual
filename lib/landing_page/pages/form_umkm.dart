import 'package:flutter/material.dart';
import 'package:p2plending_umkm/borrower/navigation_borrower.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/investor/navigation_investor.dart';

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

class RegisterBorrowerNextPage extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: 'Nama UMKM',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Alamat UMKM',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Jenis UMKM',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Usia Usaha',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'NPWP',
              ),
            ),
            SizedBox(height: 16.0),
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
              child: Text('Register'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BorrowerApp(),
                  ),
                );
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
          label: Text('Upload'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 40.0),
          ),
        ),
      ],
    );
  }
}
