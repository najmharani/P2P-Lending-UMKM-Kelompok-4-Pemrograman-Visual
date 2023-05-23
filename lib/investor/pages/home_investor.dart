import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/withdraw.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/topup.dart';

class HomeInvestor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Investor!'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Aksi saat tombol notifikasi ditekan
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Total Asetmu',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Rp 10,000,000',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 237, 237, 237),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo Aktif',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rp 0',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WithdrawalPage()),
                                  );
                                },
                                icon: Icon(Icons.attach_money_rounded),
                                color: primary,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Withdraw',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TopUpPage(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.add),
                                color: primary,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Top Up',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Pendanaan Aktif',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text('Kamu sedang mendanai 0 mitra'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Sisa Pokok',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Rp 0',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bagi hasil diterima',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Rp 0',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Tabel Kategori Mitra',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              DataTable(
                columns: [
                  DataColumn(
                    label: Container(child: Text('Kategori'), width: 100),
                  ),
                  DataColumn(
                    label: Container(child: Text('Mitra'), width: 100),
                  ),
                  DataColumn(
                    label: Container(child: Text('Sisa Pokok'), width: 100),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Mitra Lancar')),
                    DataCell(Text('0')),
                    DataCell(Text('Rp 0')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Mitra Terlambat')),
                    DataCell(Text('0')),
                    DataCell(Text('Rp 0')),
                  ]),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Akun UMKM Pendanaan Aktif',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    // Ganti dengan avatar akun
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  title: Text('Nama Akun'),
                  subtitle: Text('Pendanaan Aktif'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Aksi saat card ditekan
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
