import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/models/Detail.model.dart';
import 'package:p2plending_umkm/models/DetailSelesai.model.dart';
import 'package:p2plending_umkm/models/User.model.dart';
import 'package:p2plending_umkm/models/Investor.model.dart';
import 'package:p2plending_umkm/models/Peminjaman.model.dart';
import 'package:p2plending_umkm/models/Transaksi.model.dart';
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
          BlocProvider<DetailCubit>(
            create: (BuildContext context) => DetailCubit(),
          ),
          BlocProvider<DetailSelesaiCubit>(
            create: (BuildContext context) => DetailSelesaiCubit(),
          ),
          BlocProvider<PeminjamanCubit>(
            create: (BuildContext context) => PeminjamanCubit(),
          ),
          BlocProvider<ListPeminjamanCubit>(
            create: (BuildContext context) => ListPeminjamanCubit(),
          ),
          BlocProvider<ListDetailCubit>(
            create: (BuildContext context) => ListDetailCubit(),
          ),
          BlocProvider<ListDetailSelesaiCubit>(
            create: (BuildContext context) => ListDetailSelesaiCubit(),
          ),
          BlocProvider<InvestorCubit>(
            create: (BuildContext context) => InvestorCubit(),
          ),
          BlocProvider<TransaksiCubit>(
            create: (BuildContext context) => TransaksiCubit(),
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
