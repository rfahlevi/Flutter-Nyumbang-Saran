import 'package:nyumbang_saran/models/user_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SaranModel {
  //Paramete Saran
  int? id;
  String? noSaran;
  UserModel? userId;
  String? kondisiAwal;
  String? usulan;
  String? filePendukung;

  SaranModel({
    this.id,
    this.noSaran,
    this.userId,
    this.kondisiAwal,
    this.usulan,
    this.filePendukung,
  });

  SaranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noSaran = json['no_saran'];
    userId = json['user_id'] == null
        ? json['user_id']
        : UserModel.fromJson(json['user']);
    kondisiAwal = json['kondisi_awal'];
    usulan = json['usulan'];
    filePendukung = json['file_pendukung'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'no_saran': noSaran,
      'user_id': userId!.toJson(),
      'kondisi_awal': kondisiAwal,
      'usulan': usulan,
      'file_pendukung': filePendukung,
    };
  }
}
