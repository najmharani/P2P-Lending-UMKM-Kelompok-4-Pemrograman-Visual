import 'package:flutter/material.dart';

class InfoPendanaanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Info Aplikasi"),
        ),
        body: Center(
          child: Text(
            'Informasi Pendanaan',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
