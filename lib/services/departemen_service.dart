// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:nyumbang_saran/models/departemen_model.dart';
import 'package:nyumbang_saran/services/const.dart';
import 'package:http/http.dart' as http;

class DepartemenService {
  String baseUrl = apiUrl;

  Future<List<DepartemenModel>?> getDepartemen() async {
    var url = Uri.parse('$baseUrl/departemen');
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List dataDept = jsonDecode(response.body)["data"];
      List<DepartemenModel> departemens = [];

      for (var item in dataDept) {
        departemens.add(DepartemenModel.fromJson(item));
      }

      return departemens;
    } else {
      throw Exception("Gagal mendapatkan departemen");
    }
  }
}
