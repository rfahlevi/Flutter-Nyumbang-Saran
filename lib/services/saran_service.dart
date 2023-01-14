// ignore_for_file: avoid_print, depend_on_referenced_packages
import 'dart:convert';
import 'package:get/get.dart';
import 'package:nyumbang_saran/models/saran_model.dart';
import 'package:nyumbang_saran/services/const.dart';
import 'package:http/http.dart' as http;
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:path/path.dart' as path;

class SaranService {
  String baseUrl = apiUrl;
  String? filePath;
  String? baseName;

  SaranService({this.filePath, this.baseName});

  Future<List<SaranModel>?> getSaran(String token, int id) async {
    try {
      var url = Uri.parse('$baseUrl/saran/$id');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        List dataSaran = jsonDecode(response.body)["data"];
        print(dataSaran);
        List<SaranModel> saran = [];

        for (var item in dataSaran) {
          saran.add(SaranModel.fromJson(item));
        }

        return saran;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<SaranModel?> createSaran(
    String noSaran,
    int userId,
    String kondisiAwal,
    String usulan,
    String filePendukung,
    String token,
  ) async {
    var url = Uri.parse('$baseUrl/saran');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest(
      "POST",
      url,
    );
    request.headers.addAll(headers);
    var file = await http.MultipartFile.fromPath(
      "file_pendukung",
      filePath!,
      filename: path.basename(baseName!),
    );
    request.fields['no_saran'] = noSaran;
    request.fields['user_id'] = userId.toString();
    request.fields['kondisi_awal'] = kondisiAwal;
    request.fields['usulan'] = usulan;
    request.files.add(file);

    var response = await request.send().then((result) {
      http.Response.fromStream(result).then((response) {
        var message = response.body;
        print(message);
      });
    });
    print(response);

    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body);
    //   print(data);
    //   //Input kedalam model Saran
    //   SaranModel saran = SaranModel.fromJson(data['data']);

    //   return saran;
    // } else {
    //   Get.snackbar(
    //     "Gagal",
    //     "Saran gagal dibuat, pastikan profile sudah di update dan semua field harus diisi",
    //     colorText: whiteColor,
    //     backgroundColor: redColor,
    //     barBlur: 1,
    //   );
    // }
    return null;
  }

  Future deleteSaran(String token, int id) async {
    try {
      var url = Uri.parse('$baseUrl/saran/$id');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await http.delete(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          "Saran berhasil dihapus",
          barBlur: 1,
          colorText: blackColor,
          backgroundColor: whiteColor,
        );
      } else {
        print(response.statusCode);
        Get.snackbar(
          "Gagal",
          "Saran gagal dihapus",
          colorText: whiteColor,
          backgroundColor: redColor,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
