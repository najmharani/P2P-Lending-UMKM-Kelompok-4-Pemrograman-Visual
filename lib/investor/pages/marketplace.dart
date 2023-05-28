import 'package:flutter/material.dart';

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

  bool trackrecord1 = false;
  bool trackrecord2 = false;
  bool trackrecord3 = false;

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
            child: ElevatedButton.icon(
              onPressed: () {
                // Tambahkan logika pencarian di sini
              },
              icon: Icon(Icons.search),
              label: Text('Search'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          _buildProductCard(context, 'Product 1', 'Description of Product 1'),
          SizedBox(height: 16.0),
          _buildProductCard(context, 'Product 2', 'Description of Product 2'),
          SizedBox(height: 16.0),
          _buildProductCard(context, 'Product 3', 'Description of Product 3'),
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
              "Track Record",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            CheckboxListTile(
              title: const Text("Akurasi Pembayaran"),
              value: trackrecord1,
              onChanged: (bool? value) {
                setState(() {
                  trackrecord1 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Pendapatan"),
              value: trackrecord2,
              onChanged: (bool? value) {
                setState(() {
                  trackrecord2 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Penghargaan/penilaian?"),
              value: trackrecord3,
              onChanged: (bool? value) {
                setState(() {
                  trackrecord3 = value!;
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

                          trackrecord1 = false;
                          trackrecord2 = false;
                          trackrecord3 = false;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Padding(
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            Spacer(),
            Text(
              'Rp. 0',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
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
      ),
    );
  }
}
