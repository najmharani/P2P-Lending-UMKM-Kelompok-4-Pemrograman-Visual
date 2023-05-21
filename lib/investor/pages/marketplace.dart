import 'package:flutter/material.dart';

class Marketplace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Marketplace'),
        ),
        body: Center(
          child: Text(
            'Marketplace',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
