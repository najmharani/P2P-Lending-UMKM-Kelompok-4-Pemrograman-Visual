import 'package:flutter/material.dart';

class PinjamanBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Text(
            'Pinjaman Borrower',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
