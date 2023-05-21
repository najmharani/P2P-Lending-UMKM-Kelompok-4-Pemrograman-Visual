import 'package:flutter/material.dart';

class AktivitasBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aktivitas'),
        ),
        body: Center(
          child: Text(
            'Aktivitas Borrower',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
