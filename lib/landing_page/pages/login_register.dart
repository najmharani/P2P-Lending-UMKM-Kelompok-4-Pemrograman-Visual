import 'package:flutter/material.dart';

class LoginRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Info Aplikasi"),
        ),
        body: Center(
          child: Text(
            'Login Register',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
