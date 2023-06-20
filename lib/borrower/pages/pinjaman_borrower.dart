import 'package:flutter/material.dart';
import 'package:p2plending_umkm/borrower/pages/fitur_pinjaman/form_pengajuan_pinjaman.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/models/Detail.model.dart';
import 'dart:developer' as developer;

class AjukanPeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Anda Belum Mengajukan Pinjaman",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(188, 158, 158, 158)),
          ),
          SizedBox(height: 16),
          FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormPengajuanPinjaman(),
                  ),
                );
              },
              label: Text(
                "+ Ajukan Pinjaman",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              )), // Replace with your detail page content
        ],
      )),
    ));
  }
}

class PeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: primary.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Peminjaman Ke-1',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Investor A',
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
                                  Text('Rp 5.000.000')
                                ],
                              ),
                              Column(
                                children: [Text('%BAGI HASIL'), Text('12%')],
                              ),
                              Column(
                                children: [Text('TENOR'), Text('50 Minggu')],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundImage: AssetImage('assets/logo.png'),
                    //   radius: 50,
                    // ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    child: Column(children: [
                      Text(
                        'Detail Pinjaman',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Dalam Proses',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Waktu Pengajuan',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '2 Juni 2023',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Waktu Pendanaan',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '5 Juni 2023',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jatuh Tempo',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '5 Juli 2023',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Penghasilan per Bulan',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Rp. 3.500.000',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah Angsuran',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Rp. 700.000',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryPeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListDetailCubit, ListDetail>(
          buildWhen: (previousState, state) {
        developer.log("${previousState.listDetail} -> ${state.listDetail}",
            name: 'listlog');
        return true;
      }, builder: (context, model) {
        context.read<ListDetailCubit>().fetchData();
        if (model.listDetail.isNotEmpty) {
          return ListView.builder(
              itemCount: model.listDetail
                  .length, // Replace with the actual number of history items
              itemBuilder: (context, index) {
                return _buildProductCard(
                    context,
                    model.listDetail[index].namaLengkap,
                    model.listDetail[index].jumlahPinjaman.toString(),
                    model.listDetail[index].bagiHasil.toString(),
                    model.listDetail[index].tenor,
                    model.listDetail[index].nilaiRating,
                    model.listDetail[index].statusPinjaman,
                    model.listDetail[index].waktuPengajuan,
                    model.listDetail[index].waktuPendanaan,
                    model.listDetail[index].jatuhTempo,
                    model.listDetail[index].penghasilanPerBulan.toString(),
                    model.listDetail[index].jumlahAngsuran.toString());
              });
        } else {
          return Center(
            child: const Text("Belum ada history"),
          );
        }
      }),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String name,
    String jumlahPinjaman,
    String bagiHasil,
    String tenor,
    String nilaiRating,
    String statusPinjaman,
    String waktuPengajuan,
    String waktuPendanaan,
    String jatuhTempo,
    String penghasilanPerBulan,
    String jumlahAngsuran,
  ) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(95, 182, 233, 183),
                        child: Text(nilaiRating)),
                  ],
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [Text('PLAFOND'), Text('Rp.' + jumlahPinjaman)],
              ),
              Column(
                children: [Text('%BAGI HASIL'), Text(bagiHasil + '%')],
              ),
              Column(
                children: [Text('TENOR'), Text(tenor)],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPinjamanDetailsScreen(
                      name: name,
                      jumlahPinjaman: jumlahPinjaman,
                      bagiHasil: bagiHasil,
                      tenor: tenor,
                      nilaiRating: nilaiRating,
                      statusPinjaman: statusPinjaman,
                      waktuPengajuan: waktuPengajuan,
                      waktuPendanaan: waktuPendanaan,
                      jatuhTempo: jatuhTempo,
                      penghasilanPerBulan: penghasilanPerBulan,
                      jumlahAngsuran: jumlahAngsuran,
                    ),
                  ),
                );
              },
              child: Text('View Details'),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryPinjamanDetailsScreen extends StatelessWidget {
  final String name;
  final String jumlahPinjaman;
  final String bagiHasil;
  final String tenor;
  final String nilaiRating;
  final String statusPinjaman;
  final String waktuPengajuan;
  final String waktuPendanaan;
  final String jatuhTempo;
  final String penghasilanPerBulan;
  final String jumlahAngsuran;

  const HistoryPinjamanDetailsScreen({
    required this.name,
    required this.jumlahPinjaman,
    required this.bagiHasil,
    required this.tenor,
    required this.nilaiRating,
    required this.statusPinjaman,
    required this.waktuPengajuan,
    required this.waktuPendanaan,
    required this.jatuhTempo,
    required this.penghasilanPerBulan,
    required this.jumlahAngsuran,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjaman Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: primary.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('PLAFOND'),
                                  Text(jumlahPinjaman)
                                ],
                              ),
                              Column(
                                children: [
                                  Text('%BAGI HASIL'),
                                  Text(bagiHasil + '%')
                                ],
                              ),
                              Column(
                                children: [Text('TENOR'), Text(tenor)],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundImage: AssetImage('assets/logo.png'),
                    //   radius: 50,
                    // ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Detail Pinjaman',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Divider(
                  thickness: 3,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 10),
                    Text(
                      statusPinjaman,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Waktu Pengajuan',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 10),
                    Text(
                      waktuPengajuan,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Waktu Pendanaan',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 10),
                    Text(
                      waktuPendanaan,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jatuh Tempo',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 10),
                    Text(
                      jatuhTempo,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Penghasilan per Bulan',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 10),
                    Text(
                      penghasilanPerBulan,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumlah Angsuran',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 10),
                    Text(
                      jumlahAngsuran,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Peminjaman'),
      ),
      body: Center(
        child: Text(
            'Detail Peminjaman Page'), // Replace with your detail page content
      ),
    );
  }
}

class PinjamanBorrower extends StatefulWidget {
  @override
  _PinjamanBorrowerState createState() => _PinjamanBorrowerState();
}

class _PinjamanBorrowerState extends State<PinjamanBorrower>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // int status = 1;
  // StatelessWidget peminjaman =
  // if (status == 0) {
  //   peminjaman = AjukanPeminjamanPage();
  // }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peminjaman'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Pinjaman Sekarang'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AjukanPeminjamanPage(),
          HistoryPeminjamanPage(),
        ],
      ),
    );
  }
}
