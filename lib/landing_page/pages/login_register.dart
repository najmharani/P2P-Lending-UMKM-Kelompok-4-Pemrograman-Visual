import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:p2plending_umkm/borrower/pages/fitur_pinjaman/form_pengajuan_pinjaman.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/investor/navigation_investor.dart';
import 'package:p2plending_umkm/models/User_model.dart';
import 'package:p2plending_umkm/landing_page/pages/form_investor.dart';
import 'package:p2plending_umkm/landing_page/pages/form_umkm.dart';
import 'package:p2plending_umkm/main.dart';

// void main() {
//   runApp(LoginRegisterPage());
// }

// class LoginRegisterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Home',
//       theme: ThemeData(
//         primarySwatch: primary,
//         fontFamily: 'lexend',
//       ),
//       home: HomePage(),
//       routes: {
//         '/login-borrower': (context) => LoginPage(userType: UserType.borrower),
//         '/login-investor': (context) => LoginPage(userType: UserType.investor),
//         '/register-borrower': (context) =>
//             RegisterPage(userType: UserType.borrower),
//         '/register-investor': (context) =>
//             RegisterPage(userType: UserType.investor),
//       },
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akun',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', // Path ke logo Anda
              width: 100.0,
              height: 100.0,
            ),
            Text(
              'itulah',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text(
                'Login as Borrower',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage(userType: UserType.borrower)),
                );
              },
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text(
                'Login as Investor',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage(userType: UserType.investor)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum UserType { borrower, investor }

class LoginPage extends StatelessWidget {
  final UserType userType;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginPage({required this.userType});

  // void _login(BuildContext context) {
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();

  //   context
  //       .read<UserCubit>()
  //       .saveUser(emailController.text, passwordController.text)
  //       .then((_) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return InvestorApp();
  //         },
  //       ),
  //     );
  //   }).catchError((error) {
  //     print('Login failed: $error');
  //   });
  // }

  // void loginCheck(BuildContext context, User model) {
  //   if (model.idUser != 0) {
  //     if (model.tipeUser == "Investor") {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => InvestorApp()),
  //       );
  //     } else if (model.tipeUser == "Borrower") {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => BorrowerApp()),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Please enter both email and password'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String title;
    String profile;
    if (userType == UserType.borrower) {
      title = 'Login as Borrower';
    } else {
      title = 'Login as Investor';
    }
    if (userType == UserType.borrower) {
      profile = 'Signup as Borrower';
    } else {
      profile = 'Signup as Investor';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<UserCubit, User>(builder: (context, model) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    context
                        .read<UserCubit>()
                        .saveUser(emailController.text, passwordController.text)
                        .then((_) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return InvestorApp();
                          },
                        ),
                      );
                    }).catchError((error) {
                      print('Login failed: $error');
                    });
                  },
                ),
                SizedBox(height: 8.0),
                TextButton(
                  child: Text(profile),
                  onPressed: () {
                    if (userType == UserType.borrower) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RegisterPage(userType: UserType.borrower)),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RegisterPage(userType: UserType.investor)),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        }));
  }
}

class RegisterPage extends StatefulWidget {
  final UserType userType;
  const RegisterPage({required this.userType});

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState(userType: this.userType);
}

class _RegisterPageState extends State<RegisterPage> {
  final UserType userType;
  final emailController = TextEditingController();
  final telpController = TextEditingController();
  final passwordController = TextEditingController();

  _RegisterPageState({required this.userType});

  Future<void> insertUser(
      String email, String password, String noTelp, String tipeUser) async {
    final url = 'https://localhost:8000/tambah_User/';

    final Map<String, dynamic> userData = {
      'email': email,
      'password': password,
      'no_telp': noTelp,
      'foto_profil': '',
      'saldo': 0,
      'tipe_user': tipeUser,
      'id_tipe_user': 5,
    };

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(userData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // User inserted successfully
      // register();
      print('User berhasil ditambahkan');
    } else {
      // Error occurred while inserting user
      print('Error saat menambahkan user');
    }
  }

  // void register() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(10),
  //           topRight: Radius.circular(10),
  //         ),
  //       ),
  //       backgroundColor: Color.fromARGB(255, 0, 97, 175),
  //       content: Text(
  //         "Berhasil Membuat Akun",
  //         style: TextStyle(
  //           fontFamily: "Poppins",
  //         ),
  //       ),
  //     ),
  //   );
  //   Navigator.of(context).pop(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         if (userType == UserType.investor) {
  //           return LoginPage(userType: UserType.investor);
  //         } else {
  //           return LoginPage(userType: UserType.borrower);
  //         }
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    String title;
    if (userType == UserType.borrower) {
      title = 'Register as Borrower';
    } else {
      title = 'Register as Investor';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png', // Path ke logo Anda
              width: 100.0,
              height: 100.0,
            ),
            Text(
              'Modal to Mitra',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: telpController,
              decoration: InputDecoration(
                labelText: 'No Telp',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Re-enter Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  insertUser(emailController.text, passwordController.text,
                      telpController.text, "Investor");
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
