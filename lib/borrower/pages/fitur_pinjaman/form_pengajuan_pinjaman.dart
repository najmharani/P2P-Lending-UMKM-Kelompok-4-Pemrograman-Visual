import 'package:flutter/material.dart';

void main() {
  runApp(BorrowerApp());
}

class BorrowerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Borrower',
      debugShowCheckedModeBanner: false,
      home: FormPengajuanPinjaman(),
    );
  }
}

class FormPengajuanPinjaman extends StatelessWidget {
  // final UserType userType;

  // const RegisterPage({required this.userType});

  @override
  Widget build(BuildContext context) {
    // String title;
    // if (userType == UserType.borrower) {
    //   title = 'Register as Borrower';
    // } else {
    //   title = 'Register as Investor';
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Pengajuan Pinjaman"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Jumlah Pinjaman',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Bagi Hasil',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tenor',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Penghasilan per Bulan',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Simpan'),
              onPressed: () {
                // if (userType == UserType.borrower) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => RegisterBorrowerNextPage()),
                //   );
                // } else if (userType == UserType.investor) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => RegisterInvestorNextPage()),
                //   );
                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}
