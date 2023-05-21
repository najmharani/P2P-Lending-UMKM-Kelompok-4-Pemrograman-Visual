import 'package:flutter/material.dart';

class HomeInvestor extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Asetmu',
              ),
              const Text(
                'Rp 0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 190, 190, 190),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Saldo Aktif'),
                        const Text('Rp 0'),
                      ],
                    ),
                    Icon(Icons.circle),
                  ],
                ),
              ),
              const Text(
                'Pendanaan Aktif',
              ),
              const Text(
                'Kamu Sedang mendanai 0 mitra',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Sisa Pokok',
                      ),
                      const Text(
                        'Rp.0',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Sisa Pokok',
                      ),
                      const Text(
                        'Rp.0',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
