import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/models/User.model.dart';
import 'package:p2plending_umkm/landing_page/landing_page.dart';
import 'package:p2plending_umkm/colors.dart';

void main() {
  runApp(P2PLendingUMKMApp());
}

// class P2PLendingUMKMApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'P2PLendingUMKM',
//       theme: ThemeData(
//         primarySwatch: primary,
//         fontFamily: 'lexend',
//       ),
//       debugShowCheckedModeBanner: false,
//       home: LandingPage(),
//     );
//   }
// }

class P2PLendingUMKMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(
            create: (BuildContext context) => UserCubit(),
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
