import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:p2plending_umkm/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/models/User.model.dart';
import 'package:p2plending_umkm/models/Investor.model.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/withdraw.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/topup.dart';
import 'package:p2plending_umkm/models/Detail.model.dart';
import 'package:p2plending_umkm/models/DetailSelesai.model.dart';

class HomeInvestor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Investor!'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Total Asetmu',
                style: TextStyle(fontSize: 15),
              ),
              BlocBuilder<InvestorCubit, Investor>(builder: (context, model) {
                context.read<InvestorCubit>().fetchData();
                return Text(
                  '${model.aset.toString()}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              }),
              SizedBox(height: 2),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 3, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset in the x, y direction
                    ),
                  ],
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
                        BlocBuilder<UserCubit, User>(builder: (
                          context,
                          model,
                        ) {
                          context.read<UserCubit>().getUser();
                          return Text(
                            '${model.saldo.toString()}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        })
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
              SizedBox(height: 2),
              Text(
                'Pendanaan Aktif',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text('Kamu sedang mendanai 0 mitra'),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Tabel Kategori Mitra',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Table(
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 205, 205, 205),
                    ),
                    children: [
                      const Text('Kategori'),
                      const Text('Mitra'),
                      const Text('Sisa Pokok'),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('Mitra Lancar'),
                      const Text('0'),
                      const Text('Rp 0'),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Text('Mitra Terlambat'),
                      const Text('0'),
                      const Text('Rp 0'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Akun UMKM Pendanaan Aktif',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Container(
                height: 200,
                child: BlocBuilder<ListDetailCubit, ListDetail>(
                    buildWhen: (previousState, state) {
                  developer.log(
                      "${previousState.listDetail} -> ${state.listDetail}",
                      name: 'listlog');
                  return true;
                }, builder: (context, model) {
                  context.read<ListDetailCubit>().fetchDataAktif();
                  if (model.listDetail.isNotEmpty) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: model.listDetail.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                // Ganti dengan avatar akun
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              title: Text(model.listDetail[index].namaUmkm),
                              subtitle: Text('Pendanaan Aktif'),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                context
                                    .read<DetailCubit>()
                                    .newState(model.listDetail[index]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailAkunPage()),
                                );
                              },
                            ),
                          );
                        });
                  } else {
                    return const Text("Tidak ada UMKM aktif");
                  }
                }),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Riwayat Pendanaan',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Container(
                height: 200,
                child: BlocBuilder<ListDetailSelesaiCubit, ListDetailSelesai>(
                    buildWhen: (previousState, state) {
                  developer.log(
                      "${previousState.listDetailSelesai} -> ${state.listDetailSelesai}",
                      name: 'listlog');
                  return true;
                }, builder: (context, model) {
                  context.read<ListDetailSelesaiCubit>().fetchDataSelesai();
                  if (model.listDetailSelesai.isNotEmpty) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: model.listDetailSelesai.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                // Ganti dengan avatar akun
                                backgroundImage: AssetImage('assets/logo.png'),
                              ),
                              title:
                                  Text(model.listDetailSelesai[index].namaUmkm),
                              subtitle: Text('Pendanaan Selesai'),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                context
                                    .read<DetailSelesaiCubit>()
                                    .newState(model.listDetailSelesai[index]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailRiwayatPage()),
                                );
                              },
                            ),
                          );
                        });
                  } else {
                    return const Text("Tidak ada UMKM Riwayat");
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailAkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pendanaan'),
      ),
      body: BlocBuilder<DetailCubit, Detail>(
        buildWhen: (previousState, state) {
          developer.log(
              "${previousState.idPeminjaman} -> ${state.idPeminjaman}",
              name: 'listlog');
          return true;
        },
        builder: (context, model) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              model.namaUmkm,
                              style: TextStyle(
                                fontSize: 24,
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
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text('PLAFOND'),
                                    Text(model.jumlahPinjaman.toString())
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('%BAGI HASIL'),
                                    Text(model.bagiHasil.toString() + '%')
                                  ],
                                ),
                                Column(
                                  children: [Text('TENOR'), Text(model.tenor)],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('PENGHASILAN'),
                                    Text(model.penghasilanPerBulan.toString())
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('SISA POKOK'),
                                    Text(model.sisaTenor.toString())
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 50,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jadwal Pembayaran',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        DataTable(
                          columns: [
                            DataColumn(
                              label:
                                  Container(child: Text('Cicilan'), width: 100),
                            ),
                            DataColumn(
                              label: Container(
                                  child: Text('Jatuh Tempo'), width: 100),
                            ),
                            DataColumn(
                              label:
                                  Container(child: Text('Jumlah'), width: 100),
                            ),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(Text('1 Januari 2024')),
                              DataCell(Text('Rp 0')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('2')),
                              DataCell(Text('1 Februari 2024')),
                              DataCell(Text('Rp 0')),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum RatingType { a, amin, b, bmin, c }

class DetailRiwayatPage extends StatefulWidget {
  const DetailRiwayatPage({super.key});

  @override
  State<DetailRiwayatPage> createState() => DetailRiwayatPageState();
}

class DetailRiwayatPageState extends State<DetailRiwayatPage> {
  RatingType? valueRating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pendanaan'),
      ),
      body: BlocBuilder<DetailSelesaiCubit, DetailSelesai>(
        buildWhen: (previousState, state) {
          developer.log(
              "${previousState.idPeminjaman} -> ${state.idPeminjaman}",
              name: 'listlog');
          return true;
        },
        builder: (context, model) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              model.namaUmkm,
                              style: TextStyle(
                                fontSize: 24,
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
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text('PLAFOND'),
                                    Text(model.jumlahPinjaman.toString())
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('%BAGI HASIL'),
                                    Text(model.bagiHasil.toString() + '%')
                                  ],
                                ),
                                Column(
                                  children: [Text('TENOR'), Text(model.tenor)],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('PENGHASILAN'),
                                    Text(model.penghasilanPerBulan.toString())
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('SISA POKOK'),
                                    Text(model.sisaTenor.toString())
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 50,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        RadioListTile<RatingType>(
                          title: const Text('A'),
                          value: RatingType.a,
                          groupValue: valueRating,
                          onChanged: (RatingType? value) {
                            setState(() {
                              valueRating = value;
                            });
                          },
                        ),
                        RadioListTile<RatingType>(
                          title: const Text('A-'),
                          value: RatingType.amin,
                          groupValue: valueRating,
                          onChanged: (RatingType? value) {
                            setState(() {
                              valueRating = value; //jawaban user disimpan
                            });
                          },
                        ),
                        RadioListTile<RatingType>(
                          title: const Text('B'),
                          value: RatingType.b,
                          groupValue: valueRating,
                          onChanged: (RatingType? value) {
                            setState(() {
                              valueRating = value; //jawaban user disimpan
                            });
                          },
                        ),
                        RadioListTile<RatingType>(
                          title: const Text('B-'),
                          value: RatingType.bmin,
                          groupValue: valueRating,
                          onChanged: (RatingType? value) {
                            setState(() {
                              valueRating = value; //jawaban user disimpan
                            });
                          },
                        ),
                        RadioListTile<RatingType>(
                          title: const Text('C'),
                          value: RatingType.c,
                          groupValue: valueRating,
                          onChanged: (RatingType? value) {
                            setState(() {
                              valueRating = value; //jawaban user disimpan
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Simpan'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailRatingPage extends StatelessWidget {
  RatingType? valueRating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pendanaan'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Nama Akun',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Alamat',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [Text('PLAFOND'), Text('Rp5.000.000')],
                          ),
                          Column(
                            children: [Text('%BAGI HASIL'), Text('12%')],
                          ),
                          Column(
                            children: [Text('TENOR'), Text('50 Minggu')],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('PENGHASILAN'),
                              Text('Rp1.000.000')
                            ],
                          ),
                          Column(
                            children: [
                              Text('HASIL INVESTASI'),
                              Text('Rp5.600.000')
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                  radius: 50,
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rating yang anda berikan : A',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
