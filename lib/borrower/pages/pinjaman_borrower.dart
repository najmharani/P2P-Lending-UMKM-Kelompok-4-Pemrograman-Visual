import 'package:flutter/material.dart';

class PeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Peminjaman'), // Replace with your actual form widget
    );
  }
}

class HistoryPeminjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of history items
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPeminjamanPage(), // Replace with your detail page widget
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(
                    'History Item $index'), // Replace with your history item details
              ),
            ),
          );
        },
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
          PeminjamanPage(),
          HistoryPeminjamanPage(),
        ],
      ),
    );
  }
}
