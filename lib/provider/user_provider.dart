// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:nyumbang_saran/models/user_model.dart';
import 'package:nyumbang_saran/services/user_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _users;
  UserModel get users => _users!;
  set users(UserModel users) {
    _users = users;
    notifyListeners();
  }

  List<UserModel> _listUsers = [];
  List<UserModel> get listUsers => _listUsers;
  set listUsers(List<UserModel> users) {
    _listUsers = listUsers;
    notifyListeners();
  }

  Future<void> getUser(String token) async {
    try {
      List<UserModel>? listUsers = await UserService().getUser(token);
      _listUsers = listUsers!;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> updateUser(
    String fotoProfile,
    int nik,
    String name,
    String jenisKelamin,
    String email,
    String token,
    int departemenId,
    DateTime tanggalLahir,
    String filePath,
    String baseName,
  ) async {
    try {
      UserModel? users = await UserService(
        filePath: filePath,
        baseName: baseName,
      ).updateUser(
        fotoProfile,
        name,
        tanggalLahir,
        jenisKelamin,
        departemenId,
        nik,
        email,
        token,
      );

      _users = users;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
