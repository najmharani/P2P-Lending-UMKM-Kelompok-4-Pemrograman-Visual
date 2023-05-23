import 'package:flutter/material.dart';

class WithdrawalPage extends StatefulWidget {
  @override
  _WithdrawalPageState createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdrawal Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Withdrawal Amount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter the amount',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform withdrawal logic here
                String withdrawalAmount = _amountController.text;
                // Perform the withdrawal process
                // ...
                // Show a confirmation dialog or navigate to a success page
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Withdrawal Confirmation'),
                    content: Text('Withdrawal Amount: $withdrawalAmount'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Close the dialog and navigate back
                          Navigator.pop(context);
                          // You can also perform additional actions if needed
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
