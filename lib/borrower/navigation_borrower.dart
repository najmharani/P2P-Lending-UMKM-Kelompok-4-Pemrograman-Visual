import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/borrower/pages/home_borrower.dart';
import 'package:p2plending_umkm/borrower/pages/pinjaman_borrower.dart';
import 'package:p2plending_umkm/borrower/pages/aktivitas_borrower.dart';
import 'package:p2plending_umkm/borrower/pages/profile_borrower.dart';
import 'package:p2plending_umkm/icon.dart';

void main() {
  runApp(BorrowerApp());
}

class BorrowerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Borrower',
      theme: ThemeData(primarySwatch: primary, fontFamily: 'lexend'),
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    HomeBorrower(),
    PinjamanBorrower(),
    AktivitasBorrower(),
    ProfileBorrower(),
  ];

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: primary,
        onTap: _changePage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Custom_Icon.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom_Icon.coins),
            label: 'Pinjaman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom_Icon.chart_line),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom_Icon.user),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
