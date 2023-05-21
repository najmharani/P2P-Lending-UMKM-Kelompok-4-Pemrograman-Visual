import 'package:flutter/material.dart';

class InfoAplikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Info Aplikasi"),
        ),
        body: Center(
          child: Text(
            'Informasi Aplikasi',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
