import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddBankAccountPage extends StatefulWidget {
  @override
  _AddBankAccountPageState createState() => _AddBankAccountPageState();
}

class _AddBankAccountPageState extends State<AddBankAccountPage> {
  String? selectedBank;
  TextEditingController accountNumberController = TextEditingController();

  List<String> banks = [
    'Select a bank',
    'Bank A',
    'Bank B',
    'Bank C',
    // Add more banks as needed
  ];

  @override
  void dispose() {
    accountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bank Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bank',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedBank,
              onChanged: (value) {
                setState(() {
                  selectedBank = value;
                });
              },
              items: banks.map((bank) {
                return DropdownMenuItem<String>(
                  value: bank,
                  child: Text(bank),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: 'Select a bank',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Account Number',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: accountNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                hintText: 'Enter account number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedBank == 'Select a bank') {
                  // Show an error message or handle the invalid selection
                  return;
                }

                String bankName = selectedBank!;
                String accountNumber = accountNumberController.text;

                // Perform the necessary operations to add the bank account
                // ...

                // Show a snackbar or navigate back to the bank account list page
                // ...
              },
              child: Text('Add Bank Account'),
            ),
          ],
        ),
      ),
    );
  }
}
