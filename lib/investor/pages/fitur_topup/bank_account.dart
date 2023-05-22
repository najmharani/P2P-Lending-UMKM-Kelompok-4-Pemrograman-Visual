import 'package:flutter/material.dart';

class AccountDetailPage extends StatefulWidget {
  @override
  _AccountDetailPageState createState() => _AccountDetailPageState();
}

class _AccountDetailPageState extends State<AccountDetailPage> {
  TextEditingController _accountController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Fetch the account details from storage or API
    String accountDetails = 'Bank Account ABC';
    _accountController.text = accountDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Detail Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _accountController,
              enabled: _isEditing,
              decoration: InputDecoration(
                hintText: 'Enter account details',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEditing = !_isEditing;
                    });
                  },
                  child: Text(_isEditing ? 'Save' : 'Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform account change or deletion logic here
                    // ...
                    // Show a confirmation dialog or navigate back
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Confirmation'),
                        content: Text('Do you want to delete this account?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Close the dialog and navigate back
                              Navigator.pop(context);
                              // You can also perform additional actions if needed
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform the deletion process
                              // ...
                              // Close the dialog and navigate back
                              Navigator.pop(context);
                              // You can also perform additional actions if needed
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
