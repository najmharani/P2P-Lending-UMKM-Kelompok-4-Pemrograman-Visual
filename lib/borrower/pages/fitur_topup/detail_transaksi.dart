import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  final String transactionId;
  final String transactionType;
  final String transactionAmount;
  final String transactionDate;

  TransactionDetailPage({
    required this.transactionId,
    required this.transactionType,
    required this.transactionAmount,
    required this.transactionDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction ID: $transactionId',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Type: $transactionType',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Amount: $transactionAmount',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Date: $transactionDate',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
