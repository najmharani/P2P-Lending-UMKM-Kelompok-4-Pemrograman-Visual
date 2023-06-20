import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;

class DetailSelesai {
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
  int idBorrower2;
  int idPemilikUmkm;
  String namaUmkm;
  String deskripsiUmkm;
  String alamatUmkmProvinsi;
  String alamatUmkmDetail;
  String jenisUsaha;
  String tahunBerdiri;
  String suratIzinUsaha;
  String npwp;
  String laporanKeuangan;
  String fotoUmkm;
  String rating;
  int omzet;
  int idPemilik;
  String namaLengkap;
  String tanggalLahir;
  String jenisKelamin;
  String nik;
  String fotoKtp;
  String fotoPemilik;

  DetailSelesai({
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
    required this.idBorrower2,
    required this.idPemilikUmkm,
    required this.namaUmkm,
    required this.deskripsiUmkm,
    required this.alamatUmkmProvinsi,
    required this.alamatUmkmDetail,
    required this.jenisUsaha,
    required this.tahunBerdiri,
    required this.suratIzinUsaha,
    required this.npwp,
    required this.laporanKeuangan,
    required this.fotoUmkm,
    required this.rating,
    required this.omzet,
    required this.idPemilik,
    required this.namaLengkap,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.nik,
    required this.fotoKtp,
    required this.fotoPemilik,
  });
}

class DetailSelesaiCubit extends Cubit<DetailSelesai> {
  DetailSelesaiCubit()
      : super(DetailSelesai(
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
          idBorrower2: 0,
          idPemilikUmkm: 0,
          namaUmkm: "",
          deskripsiUmkm: "",
          alamatUmkmProvinsi: "",
          alamatUmkmDetail: "",
          jenisUsaha: "",
          tahunBerdiri: "",
          suratIzinUsaha: "",
          npwp: "",
          laporanKeuangan: "",
          fotoUmkm: "",
          rating: "",
          omzet: 0,
          idPemilik: 0,
          namaLengkap: "",
          tanggalLahir: "",
          jenisKelamin: "",
          nik: "",
          fotoKtp: "",
          fotoPemilik: "",
        ));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(DetailSelesai(
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
      idBorrower2: json["idBorrower"],
      idPemilikUmkm: json["idPemilikUmkm"],
      namaUmkm: json["namaUmkm"],
      deskripsiUmkm: json["deskripsiUmkm"],
      alamatUmkmProvinsi: json["alamatUmkmProvinsi"],
      alamatUmkmDetail: json["alamatUmkmDetail"],
      jenisUsaha: json["jenisUsaha"],
      tahunBerdiri: json["tahunBerdiri"],
      suratIzinUsaha: json["suratIzinUsaha"],
      npwp: json["npwp"],
      laporanKeuangan: json["laporanKeuangan"],
      fotoUmkm: json["fotoUmkm"],
      rating: json["rating"], //
      omzet: json["omzet"],
      idPemilik: json["idPemilik"],
      namaLengkap: json["namaLengkap"],
      tanggalLahir: json["tanggalLahir"],
      jenisKelamin: json["jenisKelamin"],
      nik: json["nik"],
      fotoKtp: json["fotoKtp"],
      fotoPemilik: json["fotoPemilik"],
    ));
  }

  void newState(DetailSelesai detailSelesai) {
    emit(detailSelesai);
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

class ListDetailSelesai {
  List<DetailSelesai> listDetailSelesai = <DetailSelesai>[];
  ListDetailSelesai({required this.listDetailSelesai});
}

class ListDetailSelesaiCubit extends Cubit<ListDetailSelesai> {
  String url_selesai = "http://localhost:8000/detail_pinjaman_selesai";

  ListDetailSelesaiCubit() : super(ListDetailSelesai(listDetailSelesai: []));

  void setFromJson(Map<String, dynamic> json) {
    List<DetailSelesai> listDetailSelesai = <DetailSelesai>[];
    var data = json["data"];
    developer.log(data.toString());
    for (var val in data) {
      listDetailSelesai.add(
        DetailSelesai(
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
          idBorrower2: val[14],
          namaUmkm: val[15],
          alamatUmkmProvinsi: val[16],
          alamatUmkmDetail: val[17],
          jenisUsaha: val[18],
          tahunBerdiri: val[19],
          suratIzinUsaha: val[20],
          npwp: val[21],
          laporanKeuangan: val[22],
          fotoUmkm: val[23],
          rating: val[24],
          omzet: val[25],
          deskripsiUmkm: val[26],
          idPemilikUmkm: val[27],
          idPemilik: val[28],
          namaLengkap: val[29],
          tanggalLahir: val[30],
          jenisKelamin: val[31],
          nik: val[32],
          fotoKtp: val[33],
          fotoPemilik: val[34],
        ),
      );
    }
    emit(ListDetailSelesai(listDetailSelesai: listDetailSelesai));
  }

  void fetchDataSelesai() async {
    final response = await http.get(Uri.parse(url_selesai));

    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
