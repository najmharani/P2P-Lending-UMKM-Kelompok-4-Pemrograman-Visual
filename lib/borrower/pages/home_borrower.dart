import 'package:flutter/material.dart';

class HomeBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lending App'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32.0),
            Text(
              'Welcome, Borrower!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 200.0,
                      width: double.infinity,
                      child: BorrowCard(
                        title: 'Top Up & Kirim Dana',
                        color: Color.fromARGB(255, 10, 150, 30),
                        onPressed: () {
                          // TODO: Implement borrowing functionality
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 50.0,
                          padding: EdgeInsets.only(left: 16.0),
                          child: BorrowCard(
                            title: 'Total Dana',
                            color: Color.fromARGB(255, 175, 175, 175),
                            onPressed: () {
                              // TODO: Implement nested card functionality
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 200.0,
                      width: double.infinity,
                      child: BorrowCard(
                        title: 'Business Name',
                        color: Colors.green,
                        onPressed: () {
                          // TODO: Implement loan status functionality
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100.0,
                          child: BorrowCard(
                            title: 'Tenggat Waktu',
                            color: Color.fromARGB(255, 0, 255, 100),
                            onPressed: () {
                              // TODO: Implement repayment functionality
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Container(
                          height: 100.0,
                          child: BorrowCard(
                            title: 'Omzet',
                            color: Color.fromARGB(255, 20, 200, 40),
                            onPressed: () {
                              // TODO: Implement support functionality
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BorrowCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  final Widget? child;

  const BorrowCard({
    required this.title,
    required this.color,
    required this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: color,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            if (child != null) SizedBox(height: 8.0),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}