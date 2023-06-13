import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/investor/navigation_investor.dart';

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

class RegisterInvestorNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration',style: TextStyle(
                  color: Colors.white,
                ),),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir',
              ),
            ),
            SizedBox(height: 16.0),
            buildGenderDropdown(),
            SizedBox(height: 16.0),
            TextField(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InvestorApp()),
                );
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
      items: <String>['Laki-laki', 'Perempuan', 'Lainnya'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // Implementasi logika saat memilih jenis kelamin di sini
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
