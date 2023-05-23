import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  final List<String> itemList = [
    'Item 1',
    'Item 2',
    'Item 3',
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
          return ListTile(
            title: Text(itemList[index]),
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
          );
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
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text(
          'Selected Item: $selectedItem',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
