import 'package:flutter/material.dart';
import 'package:p2plending_umkm/investor/pages/fitur_topup/topup.dart';

class AktivitasInvestor extends StatelessWidget {
  final List<String> transactionHistory = [
    'Transaction 1',
    'Transaction 2',
    'Transaction 3',
    'Transaction 4',
    'Transaction 5',
  ];

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
              color: Colors.blue,
              child: ListTile(
                title: Column(
                  children: [
                    Text(
                      'Dana Tersedia',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rp. 100.000',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
                                      builder: (context) => Button1Page(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.attach_money_rounded),
                                color: Colors.blue,
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
                                color: Colors.blue,
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
                                      builder: (context) => Button3Page(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.account_balance_wallet),
                                color: Colors.blue,
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: transactionHistory.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        // Handle transaction click
                        print('Clicked on: ${transactionHistory[index]}');
                      },
                      title: Text(transactionHistory[index]),
                      subtitle: Text('Subtitle for transaction'),
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
}

class Button1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button 1 Page'),
      ),
      body: Center(
        child: Text(
          'Button 1 Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Button3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button 3 Page'),
      ),
      body: Center(
        child: Text(
          'Button 3 Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
