import 'package:flutter/material.dart';

class ProfileInvestor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Text(
            'Profile Investor',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
