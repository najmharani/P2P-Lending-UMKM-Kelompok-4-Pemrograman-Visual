import 'package:flutter/material.dart';
import 'package:p2plending_umkm/landing_page/land.dart';
import 'package:p2plending_umkm/models/User.model.dart';
import 'package:p2plending_umkm/models/Investor.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2plending_umkm/main.dart';

class PasswordChangePage extends StatefulWidget {
  @override
  _PasswordChangePageState createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your current password',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            Text(
              'New Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your new password',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm your new password',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform the necessary password change operation
                // ...
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInvestor extends StatelessWidget {
  String ktpStatus = 'Uploaded'; // Replace with actual KTP status
  String selfPictureStatus =
      'Uploaded'; // Replace with actual self picture status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          BlocBuilder<UserCubit, User>(builder: (context, model) {
            return IconButton(
              icon: Icon(Icons.logout_rounded),
              onPressed: () {
                context.read<UserCubit>().deleteUser().then((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => P2PLendingUMKMApp()),
                  );
                });
              },
            );
          })
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              // Replace with actual user profile picture
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
          ),
          SizedBox(height: 10),
          Center(child:
              BlocBuilder<InvestorCubit, Investor>(builder: (context, model) {
            context.read<InvestorCubit>().fetchData();
            return Text(
              model.namaLengkap,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          })),
          SizedBox(height: 20),
          Divider(height: 10),
          SizedBox(height: 10),
          Text(
            "Informasi Akun",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
              child: BlocBuilder<UserCubit, User>(builder: (context, model) {
            context.read<UserCubit>().getUser();
            return Column(children: [
              ListTile(
                title: Text('Email'),
                subtitle: Text(model.email),
              ),
              ListTile(
                title: Text('Password'),
                subtitle: Text(model.password),
                onTap: () {
                  // Navigate to the edit date of birth page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasswordChangePage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('No Hp'),
                subtitle: Text(model.noTelp),
              ),
            ]);
          })),
          Divider(height: 10),
          SizedBox(height: 10),
          Text(
            "Profil Pribadi",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(child:
              BlocBuilder<InvestorCubit, Investor>(builder: (context, model) {
            context.read<InvestorCubit>().fetchData();
            return Column(children: [
              ListTile(
                title: Text('Nama Lengkap'),
                subtitle: Text(model.namaLengkap),
              ),
              ListTile(
                title: Text('Tanggal Lahir'),
                subtitle: Text(model.tanggalLahir),
              ),
            ]);
          })),
          ListTile(
            title: Text('KTP'),
            subtitle: Text(ktpStatus),
          ),
          ListTile(
            title: Text('Self Picture'),
            subtitle: Text(selfPictureStatus),
          ),
          Divider(height: 10),
          SizedBox(height: 10),
          Text(
            "Customer Service",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ListTile(
            title: Text('Hubungi Kami'),
            subtitle: Text("08190677882"),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text("m2m@gmail.com"),
          ),
        ],
      ),
    );
  }
}
