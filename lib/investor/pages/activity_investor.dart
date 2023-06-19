import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:intl/intl.dart';
import 'package:p2plending_umkm/models/investor.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/withdraw.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/topup.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/bank_account.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/detail_transaksi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Transaction {
  final int idTransaksi;
  final int idUser;
  final int jumlahTransaksi;
  final String jenisTransaksi;
  final String tanggalWaktuTransaksi;
  final String detailTransaksi;

  Transaction({
    required this.idTransaksi,
    required this.idUser,
    required this.jumlahTransaksi,
    required this.jenisTransaksi,
    required this.tanggalWaktuTransaksi,
    required this.detailTransaksi,
  });
}

class AktivitasInvestor extends StatefulWidget {
  @override
  _AktivitasInvestorState createState() => _AktivitasInvestorState();
}

class _AktivitasInvestorState extends State<AktivitasInvestor> {
  late String investorId;
  String selectedMonth = 'All';
  late List<Transaction> transactionHistory;
  late List<Transaction> filteredTransactions;

  @override
  void initState() {
    super.initState();
    transactionHistory = [];
    filteredTransactions = [];
    fetchTransactionHistory();
  }

  Future<void> fetchTransactionHistory() async {
    final url = 'https://api.example.com/transactions?investorId=$investorId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      transactionHistory = [];

      for (var item in data) {
        final idTransaksi = item['idTransaksi'];
        final idUser = item['idUser'];
        final jumlahTransaksi = item['jumlahTransaksi'];
        final jenisTransaksi = item['jenisTransaksi'];
        final tanggalWaktuTransaksi = item['tanggalWaktuTransaksi'];
        final detailTransaksi = item['detailTransaksi'];

        final transaksi = Transaction(
          idTransaksi: idTransaksi,
          idUser: idUser,
          jumlahTransaksi: jumlahTransaksi,
          jenisTransaksi: jenisTransaksi,
          tanggalWaktuTransaksi: tanggalWaktuTransaksi,
          detailTransaksi: detailTransaksi,
        );

        transactionHistory.add(transaksi);
      }

      filterTransactionsByMonth(selectedMonth);
    } else {
      throw Exception('Failed to fetch transaction history');
    }
  }

  void filterTransactionsByMonth(String month) {
    setState(() {
      selectedMonth = month;
      if (month == 'All') {
        filteredTransactions = List.from(transactionHistory);
      } else {
        filteredTransactions = transactionHistory
            .where((transaction) =>
                DateFormat('MMMM yyyy').format(
                    DateTime.parse(transaction.tanggalWaktuTransaksi)) ==
                month)
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
                    BlocBuilder<UserCubit, Investor>(builder: (context, model) {
                      investorId = model.id;
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
                  final transaction = filteredTransactions[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionDetailPage(
                              transactionId: transaction.idTransaksi.toString(),
                              transactionType: transaction.jenisTransaksi,
                              transactionAmount:
                                  transaction.jumlahTransaksi.toString(),
                              transactionDate: DateFormat('dd/MM/yyyy').format(
                                  DateTime.parse(
                                      transaction.tanggalWaktuTransaksi)),
                            ),
                          ),
                        );
                      },
                      title: Text(transaction.idTransaksi.toString()),
                      subtitle: Text(transaction.detailTransaksi),
                      trailing: Column(
                        children: [
                          SizedBox(height: 14),
                          Text(
                            'Rp${transaction.jumlahTransaksi.toString()}',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
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
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
