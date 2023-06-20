import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  final String transactionId;
  final String transactionType;
  final String transactionAmount;
  final String transactionDate;
  final String transactionDetail;

  TransactionDetailPage(
      {required this.transactionId,
      required this.transactionType,
      required this.transactionAmount,
      required this.transactionDate,
      required this.transactionDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green,
              size: 50.0,
            ),
            SizedBox(height: 10),
            Text(
              'Rp$transactionAmount',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$transactionDetail',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 10),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status:',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 10),
                Text(
                  'Completed',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tanggal:',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 10),
                Text(
                  transactionDate,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tipe Transaksi:',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 10),
                Text(
                  transactionType,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID Transaksi:',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 10),
                Text(
                  transactionId,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
