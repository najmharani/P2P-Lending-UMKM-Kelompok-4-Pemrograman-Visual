import 'package:flutter/material.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/add_bank_account.dart';

class BankAccountListPage extends StatefulWidget {
  @override
  _BankAccountListPageState createState() => _BankAccountListPageState();
}

class _BankAccountListPageState extends State<BankAccountListPage> {
  List<BankAccount> bankAccounts = [
    BankAccount('Bank A', '1234567890', 'John Doe'),
    BankAccount('Bank B', '0987654321', 'Jane Smith'),
    // Add more bank accounts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Accounts'),
      ),
      body: ListView.builder(
        itemCount: bankAccounts.length,
        itemBuilder: (BuildContext context, int index) {
          BankAccount bankAccount = bankAccounts[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BankAccountDetailPage(bankAccount: bankAccount),
                ),
              );
            },
            title: Text(bankAccount.bankName),
            subtitle: Text('Account Name: ${bankAccount.accountName}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBankAccountPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BankAccount {
  final String bankName;
  final String accountNumber;
  final String accountName;

  BankAccount(this.bankName, this.accountNumber, this.accountName);
}

class BankAccountDetailPage extends StatelessWidget {
  final BankAccount bankAccount;

  BankAccountDetailPage({required this.bankAccount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Account Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Bank Name'),
            subtitle: Text(bankAccount.bankName),
          ),
          ListTile(
            title: Text('Account Number'),
            subtitle: Text(bankAccount.accountNumber),
          ),
          ListTile(
            title: Text('Account Name'),
            subtitle: Text(bankAccount.accountName),
          ),
        ],
      ),
    );
  }
}
