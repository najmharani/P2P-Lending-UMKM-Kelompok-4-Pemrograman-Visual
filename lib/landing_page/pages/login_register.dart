import 'package:flutter/material.dart';
import 'package:p2plending_umkm/colors.dart';

void main() {
  runApp(LoginRegisterPage());
}

class LoginRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: HomePage(),
      routes: {
        '/login-borrower': (context) => LoginPage(userType: UserType.borrower),
        '/login-investor': (context) => LoginPage(userType: UserType.investor),
        '/register-borrower': (context) =>
            RegisterPage(userType: UserType.borrower),
        '/register-investor': (context) =>
            RegisterPage(userType: UserType.investor),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Path ke logo Anda
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Login as Borrower'),
              onPressed: () {
                Navigator.pushNamed(context, '/login-borrower');
              },
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text('Login as Investor'),
              onPressed: () {
                Navigator.pushNamed(context, '/login-investor');
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
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
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
              child: Text('Login'),
              onPressed: () {
                // Implementasi logika login di sini
              },
            ),
            SizedBox(height: 8.0),
            TextButton(
              child: Text(profile),
              onPressed: () {
                if (userType == UserType.borrower) {
                  Navigator.pushNamed(context, '/register-borrower');
                } else {
                  Navigator.pushNamed(context, '/register-investor');
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
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
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
              child: Text('Register'),
              onPressed: () {
                // Implementasi logika registrasi di sini
              },
            ),
          ],
        ),
      ),
    );
  }
}
