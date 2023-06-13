import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/landing_page/pages/form_investor.dart';
import 'package:p2plending_umkm/landing_page/pages/form_umkm.dart';

/*class InfoPeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Info Aplikasi"),
        ),
        body: Center(
          child: Text(
            'Informasi Peminjaman',
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}*/
class InfoPeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informasi Peminjaman',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          buildListItem(context, 'Article 1', 'assets/images/images1.jpg'),
          buildListItem(context, 'Article 2', 'assets/images/images2.jpg'),
          buildListItem(context, 'Article 3', 'assets/images/images3.jpg'),
        ],
      ),
    );
  }

  Widget buildListItem(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman artikel saat item ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticlePage(title)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticlePage extends StatelessWidget {
  final String title;

  ArticlePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Article Content',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
