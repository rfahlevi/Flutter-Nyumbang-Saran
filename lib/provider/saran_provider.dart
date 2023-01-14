// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:nyumbang_saran/models/saran_model.dart';
import 'package:nyumbang_saran/services/saran_service.dart';

class SaranProvider with ChangeNotifier {
  // Kumpulan Saran
  List<SaranModel> _listSaran = [];
  List<SaranModel> get listSaran => _listSaran;
  set listSaran(List<SaranModel> listSaran) {
    _listSaran = listSaran;
    notifyListeners();
  }

  // Saran
  SaranModel? _saran;
  SaranModel get saran => _saran!;
  set saran(SaranModel saran) {
    _saran = saran;
    notifyListeners();
  }

  Future<List<SaranModel>?> getSaran(String token, int id) async {
    try {
      List<SaranModel>? listSaran = await SaranService().getSaran(token, id);
      _listSaran = listSaran!;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> createSaran(
      int userId,
      String noSaran,
      String kondisiAwal,
      String usulan,
      String filePendukung,
      String token,
      String filePath,
      String baseName) async {
    try {
      SaranModel? saran =
          await SaranService(filePath: filePath, baseName: baseName)
              .createSaran(
        noSaran,
        userId,
        kondisiAwal,
        usulan,
        filePendukung,
        token,
      );

      _saran = saran;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
