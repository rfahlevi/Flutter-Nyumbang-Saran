// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:nyumbang_saran/models/departemen_model.dart';
import 'package:nyumbang_saran/services/departemen_service.dart';

class DepartemenProvider with ChangeNotifier {
  List<DepartemenModel> _departemens = [];
  List<DepartemenModel> get departemens => _departemens;

  set departemens(List<DepartemenModel> departemens) {
    _departemens = departemens;
    notifyListeners();
  }

  Future<bool> getDepartemens() async {
    try {
      List<DepartemenModel>? departemens =
          await DepartemenService().getDepartemen();
      _departemens = departemens!;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
