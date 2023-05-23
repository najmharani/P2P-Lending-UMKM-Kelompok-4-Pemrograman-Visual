import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/landing_page/pages/info_peminjaman.dart';
import 'package:p2plending_umkm/landing_page/pages/info_pendanaan.dart';
import 'package:p2plending_umkm/landing_page/pages/info_aplikasi.dart';
import 'package:p2plending_umkm/landing_page/pages/login_register.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    InfoPeminjamanPage(),
    InfoPendanaanPage(),
    InfoAplikasiPage(),
    LoginRegisterPage(),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
