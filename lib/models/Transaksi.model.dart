import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Transaksi {
  int idTransaksi;
  int idUser;
  int jumlahTransaksi;
  String jenisTransaksi;
  String tanggalWaktuTransaksi;
  String detailTransaksi;

  Transaksi({
    required this.idTransaksi,
    required this.idUser,
    required this.jumlahTransaksi,
    required this.jenisTransaksi,
    required this.tanggalWaktuTransaksi,
    required this.detailTransaksi,
  });
}

class TransaksiCubit extends Cubit<Transaksi> {
  TransaksiCubit()
      : super(Transaksi(
          idTransaksi: 0,
          idUser: 0,
          jumlahTransaksi: 0,
          jenisTransaksi: "",
          tanggalWaktuTransaksi: "",
          detailTransaksi: "",
        ));

  void setFromJson(Map<String, dynamic> json) {
    emit(Transaksi(
      idTransaksi: json["idTransaksi"],
      idUser: json["idUser"],
      jumlahTransaksi: json["jumlahTransaksi"],
      jenisTransaksi: json["jenisTransaksi"],
      tanggalWaktuTransaksi: json["tanggalWaktuTransaksi"],
      detailTransaksi: json["detailTransaksi"],
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

  Future<void> withdraw(int jumlahTransaksi, String bank) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int idUser = prefs.getInt('idUser')!;
    //String datetime = DateTime.now().toString();
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/witdhdraw_transaksi/"),
      body: jsonEncode({
        "ID_TRANSAKSI": 0,
        "jumlah_transaksi": jumlahTransaksi,
        "tanggal_waktu_transaksi": "datetime",
        "jenis_transaksi": "Penarikan",
        "detail_transaksi": "Penarikan ke ${bank}",
        "id_user": idUser
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Berhasil');
    } else {
      print('Login failed with status code ${response.statusCode}');
    }
  }
}

// class ListTransaksi {
//   List<Transaksi> listTransaksi = <Transaksi>[];
//   ListTransaksi({required this.listTransaksi});
// }

// class ListTransaksiCubit extends Cubit<ListTransaksi> {
//   String selectedMonth = "All";

//   ListTransaksiCubit() : super(ListTransaksi(listTransaksi: []));

//   void setFromJson(Map<String, dynamic> json) {
//     List<Transaksi> listTransaksi = <Transaksi>[];
//     var data = json["data"];
//     for (var val in data) {
//       listTransaksi.add(
//         Transaksi(
//           idTransaksi: val['ID_TRANSAKSI'],
//           idUser: val['is_user'],
//           jumlahTransaksi: val['jumlah_transaksi'],
//           jenisTransaksi: val['jenis_transaksi'],
//           tanggalWaktuTransaksi: val['tanggal_waktu_transaksi'],
//           detailTransaksi: val['detail_transaksi'],
//         ),
//       );
//     }
//     emit(ListTransaksi(listTransaksi: listTransaksi));
//   }

//   void fetchData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int idUser = prefs.getInt('idUser')!;
//     print(idUser);
//     final url = "http://127.0.0.1:8000/get_all_transaksi/$idUser";

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       setFromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Gagal load');
//     }
//   }

//   void setMonth(String month) {
//     selectedMonth = month;
//     fetchData();
//   }
// }
