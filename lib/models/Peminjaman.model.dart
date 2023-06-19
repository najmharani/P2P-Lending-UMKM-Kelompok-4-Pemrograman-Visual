import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;

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

class PeminjamanCubit extends Cubit<Peminjaman> {
  PeminjamanCubit()
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

class ListPeminjaman {
  List<Peminjaman> listPeminjaman = <Peminjaman>[];
  ListPeminjaman({required this.listPeminjaman});
}

class ListPeminjamanCubit extends Cubit<ListPeminjaman> {
  String url = "http://localhost:8000/get_peminjaman_belum_didanai";

  ListPeminjamanCubit() : super(ListPeminjaman(listPeminjaman: []));

  void setFromJson(Map<String, dynamic> json) {
    List<Peminjaman> listPeminjaman = <Peminjaman>[];
    var data = json["data"];
    developer.log(data.toString());
    for (var val in data) {
      listPeminjaman.add(
        Peminjaman(
          idPeminjaman: val[0],
          jumlahPinjaman: val[1],
          statusPinjaman: val[2],
          statusPengajuan: val[3],
          waktuPengajuan: val[4],
          waktuPendanaan: val[5],
          jatuhTempo: val[6],
          bagiHasil: val[7],
          tenor: val[8],
          penghasilanPerBulan: val[9],
          jumlahAngsuran: val[10],
          sisaTenor: val[11],
          nilaiRating: val[12],
          idBorrower: val[13],
        ),
      );
    }
    emit(ListPeminjaman(listPeminjaman: listPeminjaman));
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
