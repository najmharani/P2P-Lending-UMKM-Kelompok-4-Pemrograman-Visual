import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  final List<String> itemList = [
    'Bank BCA',
    'Bank BNI',
    'Alfamart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilihan Top Up'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Column(children: [
            ListTile(
              title: Text(itemList[index]),
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                // Handle list item tap
                String selectedItem = itemList[index];
                // Perform actions or navigate to a new page with the selected item
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TopUpDetailPage(selectedItem: selectedItem),
                  ),
                );
              },
            ),
            Divider(
              height: 1,
            ),
          ]);
        },
      ),
    );
  }
}

class TopUpDetailPage extends StatelessWidget {
  final String selectedItem;

  TopUpDetailPage({required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tata Cara Pembayaran'),
        ),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ListTile(
              title: Text(
                'Biaya Admin',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              trailing: Text(
                'Rp 1.000',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 5,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$selectedItem',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1234567890',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'lorem ipsum dolor sit amet, consectetur adipiscing el',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 5,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. lorem ipsum dolor sit amet, consectetur adipiscing el',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '2. lorem ipsum dolor sit amet, consectetur adipiscing el',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '3. lorem ipsum dolor sit amet, consectetur adipiscing el',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ]),
        ));
  }
}
