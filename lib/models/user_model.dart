import 'package:nyumbang_saran/models/departemen_model.dart';

class UserModel {
  //Parameter user
  int? id;
  String? fotoProfil;
  int? nik;
  String? name;
  int? departemenId;
  DepartemenModel? departemen;
  String? jenisKelamin;
  DateTime? tanggalLahir;
  String? email;
  String? password;
  String? token;
  String? roles;

  //Constructor user dari parameter user
  UserModel({
    this.id,
    this.fotoProfil,
    this.nik,
    this.name,
    this.departemenId,
    this.departemen,
    this.jenisKelamin,
    this.tanggalLahir,
    this.email,
    this.password,
    this.token,
    this.roles,
  });

  //Buat constructor JSON
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fotoProfil = json['foto_profil'];
    name = json['name'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'] == null
        ? json['tanggal_lahir']
        : DateTime.tryParse(json['tanggal_lahir']);
    departemenId = json['departemen_id'];
    departemen = json['departemen'] == null
        ? json['departemen']
        : DepartemenModel.fromJson(json['departemen']);
    nik = json['nik'];
    email = json['email'];
    token = json['token'];
    roles = json['roles'];
  }

  // Ubah constructor ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foto_profil': fotoProfil,
      'nik': nik,
      'name': name,
      'departemen_id': departemenId,
      'departemen': departemen!.toJson(),
      'jenis_kelamin': jenisKelamin,
      'tanggal_lahir': tanggalLahir,
      'email': email,
      'token': token,
      'roles': roles,
    };
  }
}
