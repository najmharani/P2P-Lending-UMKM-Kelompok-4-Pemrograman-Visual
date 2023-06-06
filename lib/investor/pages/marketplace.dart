import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';

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
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
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
          _buildProductCard(context, 'Product 1', 'Deskripsi produk 1'),
          SizedBox(height: 16.0),
          _buildProductCard(context, 'Product 2', 'Deskripsi produk 2'),
          SizedBox(height: 16.0),
          _buildProductCard(context, 'Product 3', 'Deskripsi produk 3'),
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
      BuildContext context, String name, String description) {
    return Card(
      elevation: 2.0,
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
                          name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          description,
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
                              'alamat',
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
                        'A',
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
                children: [Text('PLAFOND'), Text('Rp 5.000.000')],
              ),
              Column(
                children: [Text('%BAGI HASIL'), Text('12%')],
              ),
              Column(
                children: [Text('TENOR'), Text('50 Minggu')],
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
                        name: name, description: description),
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
  final String name;
  final String description;

  const ProductDetailsScreen({
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
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
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 50,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Informasi tambahan tentang akun ini...',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.grey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rp. 0',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Logika yang ingin Anda lakukan ketika tombol "Danai" ditekan
                    },
                    child: Text('Danai'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
