import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/models/User.model.dart';
import 'package:p2plending_umkm/models/Umkm.model.dart';
import 'package:p2plending_umkm/models/PemilikUmkm.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/borrower/pages/fitur_topup/withdraw.dart';
import 'package:p2plending_umkm/borrower/pages/fitur_topup/topup.dart';

class HomeBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, Borrower!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
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
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 60),
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                      decoration: BoxDecoration(
                        color: primary.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: BlocBuilder<UmkmCubit, Umkm>(builder: (
                        context,
                        model,
                      ) {
                        context.read<UmkmCubit>().fetchData();
                        return Column(
                          children: [
                            Text(
                              model.namaUmkm,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              model.alamatUmkmProvinsi,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8),
                            // SizedBox(height: 16),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Column(
                            //       children: [Text('PLAFOND'), Text('Rp 5.000.000')],
                            //     ),
                            //     Column(
                            //       children: [Text('%BAGI HASIL'), Text('12%')],
                            //     ),
                            //     Column(
                            //       children: [Text('TENOR'), Text('50 Minggu')],
                            //     ),
                            //   ],
                            // ),
                          ],
                        );
                      })),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    radius: 50,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                        BlocBuilder<UserCubit, User>(builder: (
                          context,
                          model,
                        ) {
                          context.read<UserCubit>().fetchData();
                          return Text(
                            '${model.saldo.toString()}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                        SizedBox(height: 10),
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
              Container(
                  child: Column(children: [
                Row(
                  children: [
                    Text(
                      'Status Pinjaman',
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Text(
                        "Aktif",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ],
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
                                  'Pengembalian Selanjutnya',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  '20 Juni 2023',
                                  style: TextStyle(
                                    fontSize: 20,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Jumlah',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Rp100.000',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
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
              ])),
              SizedBox(height: 16),
              Text(
                'Angsuran Saat Ini',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              DataTable(
                columns: [
                  DataColumn(
                    label: Container(
                      child: Text(
                        'Tenggat',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(child: Text('Pembayaran')),
                  ),
                  DataColumn(
                    label: Container(child: Text('Status')),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('2 Juni 2023')),
                    DataCell(Text('2 Juni 2023')),
                    DataCell(Text('Tepat Waktu')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('9 Juni 2023')),
                    DataCell(Text('9 Juni 2023')),
                    DataCell(Text('Terlambat')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('16 Juni 2023')),
                    DataCell(Text('-')),
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
