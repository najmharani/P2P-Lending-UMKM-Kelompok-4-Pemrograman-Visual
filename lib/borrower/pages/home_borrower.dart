import 'package:flutter/material.dart';

class HomeBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Text(
            'Home Borrower',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
