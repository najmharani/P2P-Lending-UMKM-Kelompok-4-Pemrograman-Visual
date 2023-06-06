import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class WithdrawalPage extends StatefulWidget {
  @override
  _WithdrawalPageState createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  double userBalance = 500000.0; // Replace with the user's actual balance
  String? selectedBankAccount;
  TextEditingController withdrawalAmountController = TextEditingController();

  List<String> bankAccounts = [
    'Bank Account 1',
    'Bank Account 2',
    'Bank Account 3',
    // Add more bank accounts as needed
  ];

  @override
  void dispose() {
    withdrawalAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdrawal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Current Balance',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Rp ${userBalance.toStringAsFixed(0)}', // Format balance as needed
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            Text(
              'Withdrawal Amount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: withdrawalAmountController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                hintText: 'Enter withdrawal amount',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Bank Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedBankAccount,
              onChanged: (value) {
                setState(() {
                  selectedBankAccount = value;
                });
              },
              items: bankAccounts.map((account) {
                return DropdownMenuItem<String>(
                  value: account,
                  child: Text(account),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: 'Select bank account',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double withdrawalAmount =
                    double.parse(withdrawalAmountController.text);

                // Check if the withdrawal amount exceeds the user's balance
                if (withdrawalAmount > userBalance) {
                  // Display a warning or show an error message
                  return;
                }

                String bankAccount = selectedBankAccount ?? '';

                // Show a confirmation dialog for the withdrawal
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm Withdrawal'),
                      content: Text(
                        'Withdraw Rp ${withdrawalAmount.toStringAsFixed(0)} from $bankAccount?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Perform the withdrawal operation
                            // ...

                            // Close the dialog
                            Navigator.pop(context);
                          },
                          child: Text('Confirm'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Close the dialog without performing the withdrawal
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
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
