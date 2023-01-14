// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:nyumbang_saran/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:nyumbang_saran/services/const.dart';

class AuthService {
  String baseUrl = apiUrl;

  Future<UserModel?> register({
    String? name,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      // Membuat Role User
      UserModel user = UserModel.fromJson(data['user']);
      // Menambahkan token
      user.token = 'Bearer ${data['token']}';
      print(user.token);

      return user;
    } else {
      throw Exception("Gagal register");
    }
  }

  Future<UserModel?> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      // Membuat Role User
      UserModel user = UserModel.fromJson(data['user']);
      // Menambahkan token
      user.token = 'Bearer ${data['token']}';
      var roles = data['user']['roles'];
      print(roles);
      if (roles == 'user') {
        Get.offAllNamed('/main');
      } else if (roles == 'admin') {
        Get.offAllNamed('/main');
      }

      print(user.token);

      return user;
    } else if (response.statusCode == 403) {
      throw Exception("Gagal Login");
    }
    return null;
  }

  Future<UserModel?> logout({String? token}) async {
    return null;
  }
}
