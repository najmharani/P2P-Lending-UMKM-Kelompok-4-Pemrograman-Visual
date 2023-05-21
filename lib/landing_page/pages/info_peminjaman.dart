import 'package:flutter/material.dart';

class InfoPeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Info Aplikasi"),
        ),
        body: Center(
          child: Text(
            'Informasi Peminjaman',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
