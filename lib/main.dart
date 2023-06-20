import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/models/User.model.dart';
import 'package:p2plending_umkm/models/Investor.model.dart';
import 'package:p2plending_umkm/models/Peminjaman.model.dart';
import 'package:p2plending_umkm/models/Transaksi.model.dart';
import 'package:p2plending_umkm/models/Umkm.model.dart';
import 'package:p2plending_umkm/models/PemilikUmkm.model.dart';
import 'package:p2plending_umkm/landing_page/landing_page.dart';
import 'package:p2plending_umkm/colors.dart';

void main() {
  runApp(P2PLendingUMKMApp());
}

class P2PLendingUMKMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(
            create: (BuildContext context) => UserCubit(),
          ),
          BlocProvider<PeminjamanCubit>(
            create: (BuildContext context) => PeminjamanCubit(),
          ),
          BlocProvider<ListPeminjamanCubit>(
            create: (BuildContext context) => ListPeminjamanCubit(),
          ),
          BlocProvider<InvestorCubit>(
            create: (BuildContext context) => InvestorCubit(),
          ),
          BlocProvider<TransaksiCubit>(
            create: (BuildContext context) => TransaksiCubit(),
          ),
          BlocProvider<UmkmCubit>(
            create: (BuildContext context) => UmkmCubit(),
          ),
          BlocProvider<PemilikUmkmCubit>(
            create: (BuildContext context) => PemilikUmkmCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'P2PLendingUMKM',
          theme: ThemeData(
            primarySwatch: primary,
            fontFamily: 'lexend',
          ),
          debugShowCheckedModeBanner: false,
          home: LandingPage(),
        ));
  }
}
