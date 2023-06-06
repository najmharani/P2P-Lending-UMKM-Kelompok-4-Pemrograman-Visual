import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Peminjaman {
  int idPeminjaman;
  int idBorrower;
  int jumlahPinjaman;
  String statusPengajuan;
  int bagiHasil;
  String tenor;
  String waktuPengajuan;
  String waktuPendanaan;
  String jatuhTempo;
  int penghasilanPerBulan;
  int jumlahAngsuran;
  String statusPinjaman;
  int sisaTenor;
  String nilaiRating;

  Peminjaman({
    required this.idPeminjaman,
    required this.idBorrower,
    required this.jumlahPinjaman,
    required this.statusPengajuan,
    required this.bagiHasil,
    required this.tenor,
    required this.waktuPengajuan,
    required this.waktuPendanaan,
    required this.jatuhTempo,
    required this.penghasilanPerBulan,
    required this.jumlahAngsuran,
    required this.statusPinjaman,
    required this.sisaTenor,
    required this.nilaiRating,
  });
}

class UmkmCubit extends Cubit<Peminjaman> {
  UmkmCubit()
      : super(Peminjaman(
          idPeminjaman: 0,
          idBorrower: 0,
          jumlahPinjaman: 0,
          statusPengajuan: "",
          bagiHasil: 0,
          tenor: "",
          waktuPengajuan: "",
          waktuPendanaan: "",
          jatuhTempo: "",
          penghasilanPerBulan: 0,
          jumlahAngsuran: 0,
          statusPinjaman: "",
          sisaTenor: 0,
          nilaiRating: "",
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(Peminjaman(
      idPeminjaman: json["idPeminjaman"],
      idBorrower: json["idBorrower"],
      jumlahPinjaman: json["jumlahPinjaman"],
      statusPengajuan: json["statusPengajuan"],
      bagiHasil: json["bagiHasil"],
      tenor: json["tenor"],
      waktuPengajuan: json["waktuPengajuan"],
      waktuPendanaan: json["waktuPendanaan"],
      jatuhTempo: json["jatuhTempo"],
      penghasilanPerBulan: json["penghasilanPerBulan"],
      jumlahAngsuran: json["jumlahAngsuran"],
      statusPinjaman: json["statusPinjaman"],
      sisaTenor: json["sisaTenor"],
      nilaiRating: json["nilaiRating"],
    ));
  }

  void fetchData() async {
    String url = "";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
