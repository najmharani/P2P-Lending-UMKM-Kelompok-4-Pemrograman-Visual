import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/models/Detail.model.dart';
import 'package:p2plending_umkm/models/Peminjaman.model.dart';
import 'package:p2plending_umkm/models/Detail.model.dart';
import 'dart:developer' as developer;
import 'package:p2plending_umkm/investor/navigation_investor.dart';
import 'package:p2plending_umkm/models/Transaksi.model.dart';

enum FilterOptions {
  JenisUMKM,
  LOKASI,
  TrackRecord,
}

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => MarketplaceState();
}

class MarketplaceState extends State<Marketplace> {
  bool jenisPertanian = false;
  bool jenisKuliner = false;
  bool jenisPakaian = false;
  bool jenisKecantikan = false;
  bool jenislayanan = false;

  bool lokasiBandung = false;
  bool lokasiJakarta = false;
  bool lokasiJabodetabek = false;
  bool lokasiJawaBarat = false;
  bool lokasiBanten = false;
  bool lokasiBali = false;

  bool rating1 = false;
  bool rating2 = false;
  bool rating3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.filter_alt),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan kata kunci',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    // Tambahkan logika pencarian di sini
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primary,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors
                          .white, // Ganti dengan warna ikon yang diinginkan
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ListDetailCubit, ListDetail>(
              buildWhen: (previousState, state) {
                developer.log(
                    "${previousState.listDetail} -> ${state.listDetail}",
                    name: 'listlog');
                return true;
              },
              builder: (context, model) {
                context.read<ListDetailCubit>().fetchData();
                if (model.listDetail.isNotEmpty) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: model.listDetail.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(
                        context,
                        model.listDetail[index].idPeminjaman,
                        model.listDetail[index].idBorrower,
                        model.listDetail[index].namaUmkm,
                        model.listDetail[index].jenisUsaha,
                        model.listDetail[index].alamatUmkmProvinsi,
                        model.listDetail[index].nilaiRating,
                        model.listDetail[index].jumlahPinjaman.toString(),
                        model.listDetail[index].bagiHasil.toString(),
                        model.listDetail[index].tenor,
                        model.listDetail[index].penghasilanPerBulan.toString(),
                        model.listDetail[index].deskripsiUmkm,
                        model.listDetail[index].tahunBerdiri,
                        model.listDetail[index].jumlahPinjaman.toString(),
                        model.listDetail[index].namaLengkap,
                        model.listDetail[index].rating,
                      );
                    },
                    // children: [
                    //   _buildProductCard(
                    //       context, 'Product 1', 'Deskripsi produk 1'),
                    //   SizedBox(height: 16.0),
                    //   _buildProductCard(
                    //       context, 'Product 2', 'Deskripsi produk 2'),
                    //   SizedBox(height: 16.0),
                    //   _buildProductCard(
                    //       context, 'Product 3', 'Deskripsi produk 3'),
                    // ],
                  );
                } else {
                  return const Center(
                    child: Text("Daftar peminjaman kosong"),
                  );
                }
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Text("Filter"),
            const SizedBox(height: 16.0),
            const Text(
              "Jenis UMKM",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            CheckboxListTile(
              title: const Text("Pertanian"),
              value: jenisPertanian,
              onChanged: (bool? value) {
                setState(() {
                  jenisPertanian = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Kuliner"),
              value: jenisKuliner,
              onChanged: (bool? value) {
                setState(() {
                  jenisKuliner = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Pakaian"),
              value: jenisPakaian,
              onChanged: (bool? value) {
                setState(() {
                  jenisPakaian = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Kecantikan"),
              value: jenisKecantikan,
              onChanged: (bool? value) {
                setState(() {
                  jenisKecantikan = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Layanan"),
              value: jenislayanan,
              onChanged: (bool? value) {
                setState(() {
                  jenislayanan = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Lokasi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            CheckboxListTile(
              title: const Text("Bandung"),
              value: lokasiBandung,
              onChanged: (bool? value) {
                setState(() {
                  lokasiBandung = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Jakarta"),
              value: lokasiJakarta,
              onChanged: (bool? value) {
                setState(() {
                  lokasiJakarta = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Jabodetabek"),
              value: lokasiJabodetabek,
              onChanged: (bool? value) {
                setState(() {
                  lokasiJabodetabek = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Jawa Barat"),
              value: lokasiJawaBarat,
              onChanged: (bool? value) {
                setState(() {
                  lokasiJawaBarat = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Banten"),
              value: lokasiBanten,
              onChanged: (bool? value) {
                setState(() {
                  lokasiBanten = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Bali"),
              value: lokasiBali,
              onChanged: (bool? value) {
                setState(() {
                  lokasiBali = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Rating",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            CheckboxListTile(
              title: const Text("A"),
              value: rating1,
              onChanged: (bool? value) {
                setState(() {
                  rating1 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("A-"),
              value: rating2,
              onChanged: (bool? value) {
                setState(() {
                  rating2 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("B"),
              value: rating3,
              onChanged: (bool? value) {
                setState(() {
                  rating3 = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          jenisPertanian = false;
                          jenisKuliner = false;
                          jenisPakaian = false;
                          jenisKecantikan = false;
                          jenislayanan = false;

                          lokasiBandung = false;
                          lokasiJakarta = false;
                          lokasiJabodetabek = false;
                          lokasiJawaBarat = false;
                          lokasiBanten = false;
                          lokasiBali = false;

                          rating1 = false;
                          rating2 = false;
                          rating3 = false;
                        });
                      },
                      child: const Text("Atur Ulang"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Pakai"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    int idPinjaman,
    int idBorrower,
    String namaUmkm,
    String jenisUsaha,
    String alamatProvinsi,
    String nilaiRating,
    String plafond,
    String bagiHasil,
    String tenor,
    String penghasilanPerBulan,
    String deskripsiUmkm,
    String tahunBerdiri,
    String jumlahPinjaman,
    String namaLengkap,
    String rating,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(10.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaUmkm,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          jenisUsaha,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Colors.grey,
                              size: 14.0,
                            ),
                            Text(
                              alamatProvinsi,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: primary,
                      child: Text(
                        nilaiRating,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                children: [Text('PLAFOND'), Text("Rp" + plafond)],
              ),
              Column(
                children: [Text('%BAGI HASIL'), Text(bagiHasil + "%")],
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
                    builder: (context) => ProductDetailsScreen(
                      idPinjaman: idPinjaman,
                      idBorrower: idBorrower,
                      namaUmkm: namaUmkm,
                      jenisUsaha: jenisUsaha,
                      alamatProvinsi: alamatProvinsi,
                      plafond: plafond,
                      bagiHasil: bagiHasil,
                      tenor: tenor,
                      penghasilanPerBulan: penghasilanPerBulan,
                      deskripsiUmkm: deskripsiUmkm,
                      tahunBerdiri: tahunBerdiri,
                      jumlahPinjaman: jumlahPinjaman,
                      namaLengkap: namaLengkap,
                      rating: rating,
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

class ProductDetailsScreen extends StatelessWidget {
  final int idPinjaman;
  final int idBorrower;
  final String namaUmkm;
  final String jenisUsaha;
  final String alamatProvinsi;
  final String plafond;
  final String bagiHasil;
  final String tenor;
  final String penghasilanPerBulan;
  final String deskripsiUmkm;
  final String tahunBerdiri;
  final String jumlahPinjaman;
  final String namaLengkap;
  final String rating;

  const ProductDetailsScreen({
    required this.idPinjaman,
    required this.idBorrower,
    required this.namaUmkm,
    required this.jenisUsaha,
    required this.alamatProvinsi,
    required this.plafond,
    required this.bagiHasil,
    required this.tenor,
    required this.penghasilanPerBulan,
    required this.deskripsiUmkm,
    required this.tahunBerdiri,
    required this.jumlahPinjaman,
    required this.namaLengkap,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              namaUmkm,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              alamatProvinsi,
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
                                    Text("Rp" + plafond)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('%BAGI HASIL'),
                                    Text(bagiHasil + "%")
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
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 50,
                      ),
                    ],
                  ),
                  Text(
                    'Detail UMKM',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Text(
                    deskripsiUmkm,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pendapatan',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 10),
                      Text(
                        penghasilanPerBulan,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tahun Berdiri',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 10),
                      Text(
                        tahunBerdiri,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jenis Usaha',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 10),
                      Text(
                        jenisUsaha,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pemilik UMKM',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 10),
                      Text(
                        namaLengkap,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rating UMKM',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 10),
                      Text(
                        rating,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Rp" + jumlahPinjaman,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<TransaksiCubit, Transaksi>(
                      builder: (context, model) {
                    return Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<TransaksiCubit>()
                              .pendanaan(int.parse(jumlahPinjaman), idPinjaman,
                                  idBorrower, namaUmkm, tenor)
                              .then((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InvestorApp()),
                            );
                          }).catchError((error) {
                            print('Login failed: $error');
                          });
                        },
                        child: Text('Danai'),
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
