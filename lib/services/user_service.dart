// ignore_for_file: avoid_print, depend_on_referenced_packages
import 'dart:convert';
import 'package:nyumbang_saran/models/user_model.dart';
import 'package:nyumbang_saran/services/const.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class UserService {
  String baseUrl = apiUrl;
  String? filePath;
  String? baseName;

  UserService({this.filePath, this.baseName});

  Future<List<UserModel>?> getUser(String token) async {
    try {
      var url = Uri.parse('$baseUrl/profile');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        List dataUser = jsonDecode(response.body)["user"];
        print(dataUser);
        List<UserModel> user = [];

        for (var item in dataUser) {
          user.add(UserModel.fromJson(item));
        }

        return user;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserModel?> updateUser(
    String fotoProfile,
    String name,
    DateTime tanggalLahir,
    String jenisKelamin,
    int departemenId,
    int nik,
    String email,
    String token,
  ) async {
    try {
      var url = Uri.parse('$baseUrl/profile');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var request = http.MultipartRequest(
        "POST",
        url,
      );
      request.headers.addAll(headers);
      var pic = await http.MultipartFile.fromPath(
        "foto_profil",
        filePath!,
        filename: path.basename(baseName!),
      );
      request.files.add(pic);
      request.fields['name'] = name;
      request.fields['tanggal_lahir'] = tanggalLahir.toIso8601String();
      request.fields['jenis_kelamin'] = jenisKelamin;
      request.fields['departemen_id'] = departemenId.toString();
      request.fields['nik'] = nik.toString();
      request.fields['email'] = email;

      var response = await request.send().then((result) {
        http.Response.fromStream(result).then((response) {
          var message = response.body;
          print(message);
        });
      });
      print(response);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
