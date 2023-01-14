import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyumbang_saran/models/saran_model.dart';
import 'package:nyumbang_saran/models/user_model.dart';
import 'package:nyumbang_saran/pages/home/ubah_saran.dart';
import 'package:nyumbang_saran/provider/auth_provider.dart';
import 'package:nyumbang_saran/services/saran_service.dart';
import 'package:nyumbang_saran/widgets/button.dart';
import 'package:nyumbang_saran/widgets/isloading.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:provider/provider.dart';

class DetailSaran extends StatefulWidget {
  final SaranModel saran;
  const DetailSaran({super.key, required this.saran});

  @override
  State<DetailSaran> createState() => _DetailSaranState();
}

class _DetailSaranState extends State<DetailSaran> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel authUser = authProvider.user;

    void alertHapus() {
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Text(
                "Konfirmasi !",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ),
            content: Text(
              "Apakah anda ingin menghapus saran?",
              style: blackTextStyle,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlueColor,
                    ),
                    child: Text(
                      "Tidak",
                      style: whiteTextStyle,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await SaranService()
                          .deleteSaran(authUser.token!, widget.saran.id!);
                      Get.offAllNamed('/main');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                    ),
                    child: Text(
                      "Iya",
                      style: whiteTextStyle,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      );
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: blueColor,
        centerTitle: true,
        title: Text(
          "Detail Sumbang Saran",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    kodeSumbangSaran() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kode Sumbang Saran",
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.saran.noSaran!,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    nomorIndukKaryawan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomor Induk Karyawan",
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.saran.userId!.nik == null
                  ? "-"
                  : widget.saran.userId!.nik.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    namaLengkap() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.saran.userId!.name == null
                  ? "-"
                  : widget.saran.userId!.name!,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    departemen() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Departemen",
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.saran.userId!.departemen!.deptName == null
                  ? "-"
                  : widget.saran.userId!.departemen!.deptName!,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    kondisiSaatIni() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kondisi Saat Ini",
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.saran.kondisiAwal!,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    usulan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Usulan",
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.saran.usulan!,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    filePendukung() {
      return Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "File Pendukung",
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.saran.filePendukung.toString(),
              style: blueTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }

    ubah() {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: FilledButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const UbahSaranPage();
                },
              ),
            );
          },
          label: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(whiteColor),
                      strokeWidth: 2,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Loading..",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    )
                  ],
                )
              : Text(
                  "Ubah",
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
          backgroundColor: darkBlueColor,
        ),
      );
    }

    hapus() {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: FilledButton(
          onTap: () {
            alertHapus();
          },
          label: isLoading
              ? const IsLoading()
              : Text(
                  "Hapus",
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
          backgroundColor: blueColor,
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kodeSumbangSaran(),
              nomorIndukKaryawan(),
              namaLengkap(),
              departemen(),
              kondisiSaatIni(),
              usulan(),
              filePendukung(),
              ubah(),
              hapus(),
            ],
          ),
        ),
      ),
    );
  }
}
