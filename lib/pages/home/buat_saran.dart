// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyumbang_saran/models/user_model.dart';
import 'package:nyumbang_saran/provider/auth_provider.dart';
import 'package:nyumbang_saran/provider/saran_provider.dart';
import 'package:nyumbang_saran/widgets/button.dart';
import 'package:nyumbang_saran/widgets/isloading.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class BuatSaranPage extends StatefulWidget {
  const BuatSaranPage({super.key});

  @override
  State<BuatSaranPage> createState() => _BuatSaranPageState();
}

class _BuatSaranPageState extends State<BuatSaranPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  File? file;
  String noSaran = randomNumeric(6).toString();

  TextEditingController kondisiAwalController = TextEditingController();
  TextEditingController usulanController = TextEditingController();

  Future getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf', 'doc'],
    );

    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
        print(file);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    SaranProvider saranProvider = Provider.of<SaranProvider>(context);

    createSaran() async {
      setState(() {
        isLoading = true;
      });
      if (await saranProvider.createSaran(
        user.id!,
        noSaran,
        kondisiAwalController.text,
        usulanController.text,
        file.toString(),
        user.token!,
        file!.path,
        file!.path,
      )) {
        Get.snackbar("Berhasil", "Saran Berhasil dibuat");
        Get.offAllNamed('/main');
        setState(() {
          isLoading = false;
        });
      }
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: blueColor,
        centerTitle: true,
        title: Text(
          "Buat Sumbang Saran",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    nomorIndukKaryawan() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomor Induk Karyawan",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: greyColor,
                  ),
                  color: const Color(0XFFFFFFFF)),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                        hintText: user.nik == null
                            ? "Belum ada nik, silahkan update profile"
                            : user.nik.toString(),
                        hintStyle:
                            user.nik == null ? redTextStyle : blackTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    namaLengkap() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: greyColor,
                  ),
                  color: const Color(0XFFFFFFFF)),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                        hintText: user.name,
                        hintStyle: blackTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    kondisiSaatIni() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kondisi Saat Ini",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: greyColor,
                  ),
                  color: const Color(0XFFFFFFFF)),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: kondisiAwalController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Usulan harus diisi";
                        }
                        return null;
                      },
                      minLines: 6,
                      maxLines: 12,
                      decoration: InputDecoration.collapsed(
                        hintText: "Deskripsikan kondisi saat ini",
                        hintStyle: greyTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    usulanAnda() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Usulan Anda",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: greyColor,
                  ),
                  color: const Color(0XFFFFFFFF)),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: usulanController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kondisi awal harus diisi";
                        }
                        return null;
                      },
                      minLines: 6,
                      maxLines: 12,
                      decoration: InputDecoration.collapsed(
                        hintText: "Deskripsikan usulan anda",
                        hintStyle: greyTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    unggahFile() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Unggah File (optional | Maks. 2MB)",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: getFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                  ),
                  child: Text(
                    "Pilih File",
                    style: whiteTextStyle,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    file == null ? "" : file!.path,
                    style: blackTextStyle.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    simpan() {
      return FilledButton(
        onTap: () {
          createSaran();
        },
        label: isLoading
            ? const IsLoading()
            : Text(
                "Simpan",
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
        backgroundColor: darkBlueColor,
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // kodeSumbangSaran(),
                nomorIndukKaryawan(),
                namaLengkap(),
                kondisiSaatIni(),
                usulanAnda(),
                unggahFile(),
                simpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
