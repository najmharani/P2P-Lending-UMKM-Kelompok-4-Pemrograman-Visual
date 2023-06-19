import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:intl/intl.dart';
import 'package:p2plending_umkm/models/User.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/withdraw.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/topup.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/bank_account.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/detail_transaksi.dart';

class Transaction {
  final String name;
  final DateTime date;
  final int amount;

  Transaction(this.name, this.date, this.amount);
}

class AktivitasInvestor extends StatefulWidget {
  @override
  _AktivitasInvestorState createState() => _AktivitasInvestorState();
}

class _AktivitasInvestorState extends State<AktivitasInvestor> {
  final List<Transaction> transactionHistory = [
    Transaction('Transaction 1', DateTime(2023, 5, 15), 30000),
    Transaction('Transaction 2', DateTime(2023, 5, 10), 25000),
    Transaction('Transaction 3', DateTime(2023, 4, 25), 35000),
    Transaction('Transaction 4', DateTime(2023, 4, 18), 20000),
    Transaction('Transaction 5', DateTime(2023, 3, 30), 40000),
  ];
  String selectedMonth = 'All';
  late List<Transaction> filteredTransactions;

  @override
  void initState() {
    super.initState();
    filteredTransactions = List.from(transactionHistory);
  }

  void filterTransactionsByMonth(String month) {
    setState(() {
      selectedMonth = month;
      if (month == 'All') {
        filteredTransactions = List.from(transactionHistory);
      } else {
        filteredTransactions = transactionHistory
            .where((transaction) =>
                DateFormat('MMMM yyyy').format(transaction.date) == month)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aktivitas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: primary,
              child: ListTile(
                title: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Dana Tersedia',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    BlocBuilder<UserCubit, User>(builder: (context, model) {
                      context.read<UserCubit>().fetchData();
                      return Text(
                        'Rp.${model.saldo.toString()}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      );
                    }),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WithdrawalPage()),
                                  );
                                },
                                icon: Icon(Icons.attach_money_rounded),
                                color: primary,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Withdraw',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TopUpPage(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.add),
                                color: primary,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Top Up',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BankAccountListPage(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.account_balance_wallet),
                                color: primary,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Account',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedMonth,
              hint: Text('Filter by Month'),
              onChanged: (String? month) =>
                  filterTransactionsByMonth(month ?? 'All'),
              items: _buildDropdownItems(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        // Handle transaction click
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionDetailPage(
                              transactionId: filteredTransactions[index].name,
                              transactionType: 'Pengembalian',
                              transactionAmount: '50.000',
                              transactionDate: '27/05/2023',
                            ),
                          ),
                        );
                      },
                      title: Text(filteredTransactions[index].name),
                      subtitle: Text('Subtitle for transaction'),
                      trailing: Column(children: [
                        SizedBox(height: 14),
                        Text(
                          'Rp30.000',
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        )
                      ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    List<String> months = [
      'All',
      'May 2023',
      'April 2023',
      'March 2023',
    ];

    return months
        .map((month) => DropdownMenuItem<String>(
              value: month,
              child: Text(month),
            ))
        .toList();
  }
}
