import 'package:flutter/material.dart';

class EditEmailPage extends StatefulWidget {
  final String Email;

  EditEmailPage({required this.Email});

  @override
  _EditEmailPageState createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
  late TextEditingController _EmailController;

  @override
  void initState() {
    _EmailController = TextEditingController(text: widget.Email);
    super.initState();
  }

  @override
  void dispose() {
    _EmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Email'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _EmailController,
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedEmail = _EmailController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

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

class ProfileBorrower extends StatelessWidget {
  String email = 'najma@gmail.com';
  String pass = '*****';
  String fullName = 'Najma Qalbi'; // Replace with actual user full name
  String dateOfBirth = '02/09/2003'; // Replace with actual user date of birth
  String phoneNumber = '1234567890'; // Replace with actual user phone number
  String ktpStatus = 'Uploaded'; // Replace with actual KTP status
  String selfPictureStatus =
      'Uploaded'; // Replace with actual self picture status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
          Center(
            child: Text(
              fullName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(height: 10),
          SizedBox(height: 10),
          Text(
            "Informasi Akun",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(email),
            onTap: () {
              // Navigate to the edit full name page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditEmailPage(Email: email),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Password'),
            subtitle: Text(pass),
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
          Divider(height: 10),
          SizedBox(height: 10),
          Text(
            "Profil Pribadi",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ListTile(
            title: Text('Nama Lengkap'),
            subtitle: Text(fullName),
            onTap: () {
              // Navigate to the edit full name page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditFullNamePage(fullName: fullName),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Tanggal Lahir'),
            subtitle: Text(dateOfBirth),
            onTap: () {
              // Navigate to the edit date of birth page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditDateOfBirthPage(dateOfBirth: dateOfBirth),
                ),
              );
            },
          ),
          ListTile(
            title: Text('No Hp'),
            subtitle: Text(phoneNumber),
            onTap: () {
              // Navigate to the edit phone number page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditPhoneNumberPage(phoneNumber: phoneNumber),
                ),
              );
            },
          ),
          ListTile(
            title: Text('KTP'),
            subtitle: Text(ktpStatus),
            onTap: () {
              // Navigate to the KTP detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InvestorKTPDetailPage(ktpStatus: ktpStatus),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Self Picture'),
            subtitle: Text(selfPictureStatus),
            onTap: () {
              // Navigate to the self picture detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InvestorSelfPictureDetailPage(
                      selfPictureStatus: selfPictureStatus),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EditFullNamePage extends StatefulWidget {
  final String fullName;

  EditFullNamePage({required this.fullName});

  @override
  _EditFullNamePageState createState() => _EditFullNamePageState();
}

class _EditFullNamePageState extends State<EditFullNamePage> {
  late TextEditingController _fullNameController;

  @override
  void initState() {
    _fullNameController = TextEditingController(text: widget.fullName);
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Full Name'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated full name
                String updatedFullName = _fullNameController.text;
                // Perform the necessary update operation
                // ...

                // Show a snackbar or navigate back to the profile page
                // ...
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditDateOfBirthPage extends StatefulWidget {
  final String dateOfBirth;

  EditDateOfBirthPage({required this.dateOfBirth});

  @override
  _EditDateOfBirthPageState createState() => _EditDateOfBirthPageState();
}

class _EditDateOfBirthPageState extends State<EditDateOfBirthPage> {
  late TextEditingController _dateOfBirthController;

  @override
  void initState() {
    _dateOfBirthController = TextEditingController(text: widget.dateOfBirth);
    super.initState();
  }

  @override
  void dispose() {
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Date of Birth'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date of Birth',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _dateOfBirthController,
              decoration: InputDecoration(
                hintText: 'Enter your date of birth',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated date of birth
                String updatedDateOfBirth = _dateOfBirthController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditPhoneNumberPage extends StatefulWidget {
  final String phoneNumber;

  EditPhoneNumberPage({required this.phoneNumber});

  @override
  _EditPhoneNumberPageState createState() => _EditPhoneNumberPageState();
}

class _EditPhoneNumberPageState extends State<EditPhoneNumberPage> {
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Phone Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedPhoneNumber = _phoneNumberController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class InvestorKTPDetailPage extends StatelessWidget {
  final String ktpStatus;

  InvestorKTPDetailPage({required this.ktpStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KTP Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'KTP Status: $ktpStatus',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the KTP edit page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditKTPPage(ktpStatus: ktpStatus),
                  ),
                );
              },
              child: Text('Edit KTP'),
            ),
          ],
        ),
      ),
    );
  }
}

class InvestorSelfPictureDetailPage extends StatelessWidget {
  final String selfPictureStatus;

  InvestorSelfPictureDetailPage({required this.selfPictureStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self Picture Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Self Picture Status: $selfPictureStatus',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the self picture edit page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditSelfPicturePage(
                        selfPictureStatus: selfPictureStatus),
                  ),
                );
              },
              child: Text('Edit Self Picture'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditKTPPage extends StatefulWidget {
  final String ktpStatus;

  EditKTPPage({required this.ktpStatus});

  @override
  _EditKTPPageState createState() => _EditKTPPageState();
}

class _EditKTPPageState extends State<EditKTPPage> {
  bool isKTPUploaded = false;

  @override
  void initState() {
    isKTPUploaded = (widget.ktpStatus == 'Uploaded');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit KTP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: Text('KTP Uploaded'),
              value: isKTPUploaded,
              onChanged: (bool? value) {
                setState(() {
                  isKTPUploaded = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated KTP status
                String updatedKTPStatus =
                    isKTPUploaded ? 'Uploaded' : 'Not Uploaded';
                // Perform the necessary update operation
                // ...

                // Show a snackbar or navigate back to the profile page
                // ...
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditSelfPicturePage extends StatefulWidget {
  final String selfPictureStatus;

  EditSelfPicturePage({required this.selfPictureStatus});

  @override
  _EditSelfPicturePageState createState() => _EditSelfPicturePageState();
}

class _EditSelfPicturePageState extends State<EditSelfPicturePage> {
  bool isSelfPictureUploaded = false;

  @override
  void initState() {
    isSelfPictureUploaded = (widget.selfPictureStatus == 'Uploaded');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Self Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: Text('Self Picture Uploaded'),
              value: isSelfPictureUploaded,
              onChanged: (bool? value) {
                setState(() {
                  isSelfPictureUploaded = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated self picture status
                String updatedSelfPictureStatus =
                    isSelfPictureUploaded ? 'Uploaded' : 'Not Uploaded';
                // Perform the necessary update operation
                // ...

                // Show a snackbar or navigate back to the profile page
                // ...
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
