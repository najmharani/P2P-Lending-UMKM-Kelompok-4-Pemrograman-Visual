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
  
  String namaUMKM = 'UMKM Sahabat Jaya'; // Replace with actual user full name
  String alamatUMKM = 'Gegerkalong, Bandung, Jawa Barat'; // Replace with actual user date of birth
  String jenisUsaha = 'Sembako'; // Replace with actual user full name
  String tahunBerdiri = '2012'; // Replace with actual user date of birth
  String deskripsiUMKM = 'Lorem ipsum dolor sit amet.'; // Replace with actual user full name
  String suratIzinUsaha = 'Uploaded'; // Replace with actual user date of birth
  String laporanKeuangan = 'Uploaded'; // Replace with actual user full name
  String fotoUMKM = 'Uploaded'; // Replace with actual user date of birth

  String namaLengkap = 'Najma Qalbi'; // Replace with actual user full name
  String tanggalLahir = '02/09/2003'; // Replace with actual user date of birth
  String jenisKelamin = 'Perempuan'; // Replace with actual KTP status
  String nik = '133712345670'; // Replace with actual KTP status
  String fotoKTP = 'Uploaded'; // Replace with actual KTP status
  String fotoPemilik = 'Uploaded'; // Replace with actual KTP status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              // Aksi saat tombol notifikasi ditekan
            },
          ),
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
          Center(
            child: Text(
              namaLengkap,
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
            "Profil UMKM",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ListTile(
            title: Text('Nama UMKM'),
            subtitle: Text(namaUMKM),
            onTap: () {
              // Navigate to the edit full name page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNamaUMKMPage(namaUMKM: namaUMKM),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Alamat UMKM'),
            subtitle: Text(alamatUMKM),
            onTap: () {
              // Navigate to the edit date of birth page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditAlamatUMKMPage(alamatUMKM: alamatUMKM),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Jenis Usaha'),
            subtitle: Text(jenisUsaha),
            onTap: () {
              // Navigate to the edit date of birth page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditJenisUsahaPage(jenisUsaha: jenisUsaha),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Tahun Berdiri'),
            subtitle: Text(tahunBerdiri),
            onTap: () {
              // Navigate to the edit date of birth page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditTahunBerdiriPage(tahunBerdiri: tahunBerdiri),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Deskripsi UMKM'),
            subtitle: Text(deskripsiUMKM),
            onTap: () {
              // Navigate to the edit date of birth page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditDeskripsiUMKMPage(deskripsiUMKM: deskripsiUMKM),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Surat Izin Usaha'),
            subtitle: Text(suratIzinUsaha),
            onTap: () {
              // Navigate to the self picture detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => 
                      EditSuratIzinUsahaPage(suratIzinUsaha: suratIzinUsaha),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Laporan Keuangan'),
            subtitle: Text(laporanKeuangan),
            onTap: () {
              // Navigate to the self picture detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => 
                      EditLaporanKeuanganPage(laporanKeuangan: laporanKeuangan),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Foto UMKM'),
            subtitle: Text(fotoUMKM),
            onTap: () {
              // Navigate to the self picture detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => 
                      EditFotoUMKMPage(fotoUMKM: fotoUMKM),
                ),
              );
            },
          ),
          Divider(height: 10),
          SizedBox(height: 10),
          Text(
            "Profil Pemilik UMKM",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ListTile(
            title: Text('Nama Lengkap'),
            subtitle: Text(namaLengkap),
            onTap: () {
              // Navigate to the edit full name page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNamaLengkapPage(namaLengkap: namaLengkap),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Tanggal Lahir'),
            subtitle: Text(tanggalLahir),
            onTap: () {
              // Navigate to the edit date of birth page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditTanggalLahirPage(tanggalLahir: tanggalLahir),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Jenis Kelamin'),
            subtitle: Text(jenisKelamin),
            onTap: () {
              // Navigate to the KTP detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditJenisKelaminPage(jenisKelamin: jenisKelamin),
                ),
              );
            },
          ),
          ListTile(
            title: Text('NIK'),
            subtitle: Text(nik),
            onTap: () {
              // Navigate to the KTP detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditNIKPage(nik: nik),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Foto KTP'),
            subtitle: Text(fotoKTP),
            onTap: () {
              // Navigate to the self picture detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditFotoKTPPage(fotoKTP: fotoKTP),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Foto Pemilik'),
            subtitle: Text(fotoPemilik),
            onTap: () {
              // Navigate to the self picture detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditFotoPemilikPage(fotoPemilik: fotoPemilik),
                ),
              );
            },
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

class EditNamaUMKMPage extends StatefulWidget {
  final String namaUMKM;

  EditNamaUMKMPage({required this.namaUMKM});

  @override
  _EditNamaUMKMPageState createState() => _EditNamaUMKMPageState();
}

class _EditNamaUMKMPageState extends State<EditNamaUMKMPage> {
  late TextEditingController _namaUMKMController;

  @override
  void initState() {
    _namaUMKMController = TextEditingController(text: widget.namaUMKM);
    super.initState();
  }

  @override
  void dispose() {
    _namaUMKMController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Nama UMKM'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama UMKM',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _namaUMKMController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedNamaUMKM = _namaUMKMController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditAlamatUMKMPage extends StatefulWidget {
  final String alamatUMKM;

  EditAlamatUMKMPage({required this.alamatUMKM});

  @override
  _EditAlamatUMKMPageState createState() => _EditAlamatUMKMPageState();
}

class _EditAlamatUMKMPageState extends State<EditAlamatUMKMPage> {
  late TextEditingController _alamatUMKMController;

  @override
  void initState() {
    _alamatUMKMController = TextEditingController(text: widget.alamatUMKM);
    super.initState();
  }

  @override
  void dispose() {
    _alamatUMKMController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Alamat UMKM'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat UMKM',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _alamatUMKMController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedAlamatUMKM = _alamatUMKMController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditJenisUsahaPage extends StatefulWidget {
  final String jenisUsaha;

  EditJenisUsahaPage({required this.jenisUsaha});

  @override
  _EditJenisUsahaPageState createState() => _EditJenisUsahaPageState();
}

class _EditJenisUsahaPageState extends State<EditJenisUsahaPage> {
  late TextEditingController _jenisUsahaController;

  @override
  void initState() {
    _jenisUsahaController = TextEditingController(text: widget.jenisUsaha);
    super.initState();
  }

  @override
  void dispose() {
    _jenisUsahaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Jenis Usaha'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Usaha',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _jenisUsahaController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedJenisUsaha = _jenisUsahaController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditTahunBerdiriPage extends StatefulWidget {
  final String tahunBerdiri;

  EditTahunBerdiriPage({required this.tahunBerdiri});

  @override
  _EditTahunBerdiriPageState createState() => _EditTahunBerdiriPageState();
}

class _EditTahunBerdiriPageState extends State<EditTahunBerdiriPage> {
  late TextEditingController _tahunBerdiriController;

  @override
  void initState() {
    _tahunBerdiriController = TextEditingController(text: widget.tahunBerdiri);
    super.initState();
  }

  @override
  void dispose() {
    _tahunBerdiriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Tahun Berdiri'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tahun Berdiri',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _tahunBerdiriController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedTahunBerdiri = _tahunBerdiriController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditDeskripsiUMKMPage extends StatefulWidget {
  final String deskripsiUMKM;

  EditDeskripsiUMKMPage({required this.deskripsiUMKM});

  @override
  _EditDeskripsiUMKMPageState createState() => _EditDeskripsiUMKMPageState();
}

class _EditDeskripsiUMKMPageState extends State<EditDeskripsiUMKMPage> {
  late TextEditingController _deskripsiUMKMController;

  @override
  void initState() {
    _deskripsiUMKMController = TextEditingController(text: widget.deskripsiUMKM);
    super.initState();
  }

  @override
  void dispose() {
    _deskripsiUMKMController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Deskripsi UMKM'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi UMKM',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _deskripsiUMKMController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedDeskripsiUMKM = _deskripsiUMKMController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditSuratIzinUsahaPage extends StatefulWidget {
  final String suratIzinUsaha;

  EditSuratIzinUsahaPage({required this.suratIzinUsaha});

  @override
  _EditSuratIzinUsahaPageState createState() => _EditSuratIzinUsahaPageState();
}

class _EditSuratIzinUsahaPageState extends State<EditSuratIzinUsahaPage> {
  late TextEditingController _suratIzinUsahaController;

  @override
  void initState() {
    _suratIzinUsahaController = TextEditingController(text: widget.suratIzinUsaha);
    super.initState();
  }

  @override
  void dispose() {
    _suratIzinUsahaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Surat Izin Usaha'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Surat Izin Usaha',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _suratIzinUsahaController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedSuratIzinUsaha = _suratIzinUsahaController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditLaporanKeuanganPage extends StatefulWidget {
  final String laporanKeuangan;

  EditLaporanKeuanganPage({required this.laporanKeuangan});

  @override
  _EditLaporanKeuanganPageState createState() => _EditLaporanKeuanganPageState();
}

class _EditLaporanKeuanganPageState extends State<EditLaporanKeuanganPage> {
  late TextEditingController _laporanKeuanganController;

  @override
  void initState() {
    _laporanKeuanganController = TextEditingController(text: widget.laporanKeuangan);
    super.initState();
  }

  @override
  void dispose() {
    _laporanKeuanganController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Laporan Keuangan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Laporan Keuangan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _laporanKeuanganController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedLaporanKeuangan = _laporanKeuanganController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditFotoUMKMPage extends StatefulWidget {
  final String fotoUMKM;

  EditFotoUMKMPage({required this.fotoUMKM});

  @override
  _EditFotoUMKMPageState createState() => _EditFotoUMKMPageState();
}

class _EditFotoUMKMPageState extends State<EditFotoUMKMPage> {
  late TextEditingController _fotoUMKMController;

  @override
  void initState() {
    _fotoUMKMController = TextEditingController(text: widget.fotoUMKM);
    super.initState();
  }

  @override
  void dispose() {
    _fotoUMKMController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Foto UMKM'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foto UMKM',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _fotoUMKMController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedFotoUMKM = _fotoUMKMController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditNamaLengkapPage extends StatefulWidget {
  final String namaLengkap;

  EditNamaLengkapPage({required this.namaLengkap});

  @override
  _EditNamaLengkapPageState createState() => _EditNamaLengkapPageState();
}

class _EditNamaLengkapPageState extends State<EditNamaLengkapPage> {
  late TextEditingController _namaLengkapController;

  @override
  void initState() {
    _namaLengkapController = TextEditingController(text: widget.namaLengkap);
    super.initState();
  }

  @override
  void dispose() {
    _namaLengkapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Nama Lengkap'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _namaLengkapController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedNamaLengkap = _namaLengkapController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditTanggalLahirPage extends StatefulWidget {
  final String tanggalLahir;

  EditTanggalLahirPage({required this.tanggalLahir});

  @override
  _EditTanggalLahirPageState createState() => _EditTanggalLahirPageState();
}

class _EditTanggalLahirPageState extends State<EditTanggalLahirPage> {
  late TextEditingController _tanggalLahirController;

  @override
  void initState() {
    _tanggalLahirController = TextEditingController(text: widget.tanggalLahir);
    super.initState();
  }

  @override
  void dispose() {
    _tanggalLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Tanggal Lahir'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Lahir',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _tanggalLahirController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedTanggalLahir = _tanggalLahirController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditJenisKelaminPage extends StatefulWidget {
  final String jenisKelamin;

  EditJenisKelaminPage({required this.jenisKelamin});

  @override
  _EditJenisKelaminPageState createState() => _EditJenisKelaminPageState();
}

class _EditJenisKelaminPageState extends State<EditJenisKelaminPage> {
  late TextEditingController _jenisKelaminController;

  @override
  void initState() {
    _jenisKelaminController = TextEditingController(text: widget.jenisKelamin);
    super.initState();
  }

  @override
  void dispose() {
    _jenisKelaminController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Jenis Kelamin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _jenisKelaminController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedJenisKelamin = _jenisKelaminController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditNIKPage extends StatefulWidget {
  final String nik;

  EditNIKPage({required this.nik});

  @override
  _EditNIKPageState createState() => _EditNIKPageState();
}

class _EditNIKPageState extends State<EditNIKPage> {
  late TextEditingController _nikController;

  @override
  void initState() {
    _nikController = TextEditingController(text: widget.nik);
    super.initState();
  }

  @override
  void dispose() {
    _nikController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit NIK'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NIK',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _nikController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedNIK = _nikController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditFotoKTPPage extends StatefulWidget {
  final String fotoKTP;

  EditFotoKTPPage({required this.fotoKTP});

  @override
  _EditFotoKTPPageState createState() => _EditFotoKTPPageState();
}

class _EditFotoKTPPageState extends State<EditFotoKTPPage> {
  late TextEditingController _fotoKTPController;

  @override
  void initState() {
    _fotoKTPController = TextEditingController(text: widget.fotoKTP);
    super.initState();
  }

  @override
  void dispose() {
    _fotoKTPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Foto KTP'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foto KTP',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _fotoKTPController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedFotoKTP = _fotoKTPController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditFotoPemilikPage extends StatefulWidget {
  final String fotoPemilik;

  EditFotoPemilikPage({required this.fotoPemilik});

  @override
  _EditFotoPemilikPageState createState() => _EditFotoPemilikPageState();
}

class _EditFotoPemilikPageState extends State<EditFotoPemilikPage> {
  late TextEditingController _fotoPemilikController;

  @override
  void initState() {
    _fotoPemilikController = TextEditingController(text: widget.fotoPemilik);
    super.initState();
  }

  @override
  void dispose() {
    _fotoPemilikController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Foto Pemilik'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foto Pemilik',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _fotoPemilikController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                // Add additional styling as desired
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated phone number
                String updatedFotoPemilik = _fotoPemilikController.text;
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}