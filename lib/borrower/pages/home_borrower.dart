import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/borrower/pages/fitur_topup/withdraw.dart';
import 'package:p2plending_umkm/borrower/pages/fitur_topup/topup.dart';

class HomeBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Borrower!'),
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
                                      builder: (context) => WithdrawalPage(),
                                    ),
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
                                color: Colors.black54,
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
                                color: Colors.black54,
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
              Row(
                children: [
                  Expanded(
                      child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Tenggat Waktu',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                '20 Juni 2023',
                                style: TextStyle(
                                  fontSize: 22,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 80, // Adjust the height as needed
                            child: VerticalDivider(
                              width: 2,
                              thickness: 2,
                            ),
                          ),
                          Text(
                            '30 Hari Lagi',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(width: 10.0),
                  // Expanded(
                  //   child: Card(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(16.0),
                  //       child: Column(children: [
                  //         Text(
                  //           'H-20 Pengembalian',
                  //           style: TextStyle(fontSize: 16, height: 1.5),
                  //         ),
                  //       ]),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Angsuran Pengembalian',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              DataTable(
                columns: [
                  DataColumn(
                    label: Container(child: Text('Tanggal'), width: 100),
                  ),
                  DataColumn(
                    label: Container(child: Text('Status'), width: 100),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('2 Juni 2023')),
                    DataCell(Text('Tepat Waktu')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5 Mei 2023')),
                    DataCell(Text('Terlambat')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5 Juni 2023')),
                    DataCell(Text('Belum Dibayar')),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
