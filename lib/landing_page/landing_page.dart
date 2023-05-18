import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('P2PLendingUMKM'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changePage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Info Peminjaman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Info Pendanaan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info Aplikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login/Register',
          ),
        ],
      ),
    );
  }
}
