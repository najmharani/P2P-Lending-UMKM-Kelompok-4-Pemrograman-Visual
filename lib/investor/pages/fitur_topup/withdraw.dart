import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:p2plending_umkm/models/User.model.dart';
import 'package:p2plending_umkm/models/Transaksi.model.dart';
import 'package:p2plending_umkm/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/investor/navigation_investor.dart';

class WithdrawalPage extends StatefulWidget {
  @override
  _WithdrawalPageState createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  String? selectedBankAccount;
  TextEditingController withdrawalAmountController = TextEditingController();

  List<String> bankAccounts = [
    'Bank BNI',
    'Bank BRI',
    'Bank BCA',
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
              'Jumlah Saldo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Center(
                child: BlocBuilder<UserCubit, User>(builder: (context, model) {
              context.read<UserCubit>().fetchData();
              return Text(
                'Rp.${model.saldo.toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              );
            })),
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
            BlocBuilder<UserCubit, User>(builder: (context, model) {
              context.read<UserCubit>().fetchData();
              return ElevatedButton(
                onPressed: () {
                  int withdrawalAmount =
                      int.parse(withdrawalAmountController.text);
                  if (withdrawalAmount > model.saldo) {
                    // Display a warning or show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        backgroundColor: Colors.red,
                        content: Text(
                          "Jumlah saldo kurang",
                          style: TextStyle(
                            fontFamily: "lexend",
                          ),
                        ),
                      ),
                    );
                  } else {
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
                            BlocBuilder<TransaksiCubit, Transaksi>(
                                builder: (context, model) {
                              return TextButton(
                                onPressed: () {
                                  context
                                      .read<TransaksiCubit>()
                                      .withdraw(withdrawalAmount, bankAccount)
                                      .then((_) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InvestorApp()),
                                    );
                                  }).catchError((error) {
                                    print('Withdraw failed: $error');
                                  });
                                },
                                child: Text('Confirm'),
                              );
                            }),
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
                  }
                },
                child: Text('Withdraw'),
              );
            })
          ],
        ),
      ),
    );
  }
}
