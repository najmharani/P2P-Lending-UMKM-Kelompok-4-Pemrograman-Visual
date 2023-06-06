import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/borrower/pages/fitur_topup/withdraw.dart';
import 'package:p2plending_umkm/borrower/pages/fitur_topup/topup.dart';

class HomeBorrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Aksi saat tombol notifikasi ditekan
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: BorrowCard(
                              title: 'Lorem ipsum',
                              color: Color.fromARGB(255, 10, 150, 30),
                              onPressed: () {
                                // TODO: Implement borrowing functionality
                              },
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 80.0,
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
                        ],
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your business name here',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Additional text or information',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Your tenggat waktu here',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Additional text or information',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Your omzet here',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Additional text or information',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
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
