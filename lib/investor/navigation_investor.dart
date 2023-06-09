import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/icon.dart';
import 'package:p2plending_umkm/investor/pages/home_investor.dart';
import 'package:p2plending_umkm/investor/pages/marketplace.dart';
import 'package:p2plending_umkm/investor/pages/activity_investor.dart';
import 'package:p2plending_umkm/investor/pages/profile_investor.dart';

void main() {
  runApp(InvestorApp());
}

class InvestorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investor',
      theme: ThemeData(primarySwatch: primary, fontFamily: 'lexend'),
      debugShowCheckedModeBanner: false,
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
    HomeInvestor(),
    Marketplace(),
    AktivitasInvestor(),
    ProfileInvestor(),
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
        unselectedItemColor: Colors.black,
        selectedItemColor: primary,
        currentIndex: _currentIndex,
        onTap: _changePage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Custom_Icon.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom_Icon.coins),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom_Icon.chart_line),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Custom_Icon.user),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
