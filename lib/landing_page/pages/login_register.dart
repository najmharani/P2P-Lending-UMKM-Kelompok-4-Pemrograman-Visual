import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';
import 'package:p2plending_umkm/landing_page/pages/form_investor.dart';
import 'package:p2plending_umkm/landing_page/pages/form_umkm.dart';

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

  const LoginPage({required this.userType});

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
              'itulah',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // Implementasi logika login di sini
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
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  final UserType userType;

  const RegisterPage({required this.userType});

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
              'itulah',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
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
                if (userType == UserType.borrower) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterBorrowerNextPage()),
                  );
                } else if (userType == UserType.investor) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterInvestorNextPage()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
