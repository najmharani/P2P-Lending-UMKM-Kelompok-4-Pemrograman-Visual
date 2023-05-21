import 'package:flutter/material.dart';

class ProfileBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Text(
            'Profile Borrower',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
