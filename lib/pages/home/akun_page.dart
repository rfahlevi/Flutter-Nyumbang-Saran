import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nyumbang_saran/models/user_model.dart';
import 'package:nyumbang_saran/provider/auth_provider.dart';
import 'package:nyumbang_saran/provider/user_provider.dart';
import 'package:nyumbang_saran/services/const.dart';
import 'package:nyumbang_saran/services/user_service.dart';
import 'package:nyumbang_saran/widgets/button.dart';
import 'package:nyumbang_saran/widgets/isloading.dart';
import 'package:nyumbang_saran/widgets/percent_indicator.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:provider/provider.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    UserModel auth = authProvider.user;
    UserProvider currentUser =
        Provider.of<UserProvider>(context, listen: false);
    currentUser.getUser(auth.token!);
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    UserModel auth = authProvider.user;
    UserProvider user = Provider.of<UserProvider>(context);

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: blueColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 160,
        elevation: 0,
        title: Column(
            children: user.listUsers.map((user) {
          return Column(
            children: [
              Text(
                "Akun",
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child:
                    // SizedBox(),
                    user.fotoProfil == null
                        ? Image.asset('assets/image_profile.png')
                        : Image.network(
                            '$imageUrl/nyumbangSaran/storage/app/foto-profil/${user.fotoProfil}'),
              ),
            ],
          );
        }).toList()),
      );
    }

    profileTitle() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profil Anda",
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/edit-profil');
              },
              child: Text(
                "Edit Profil",
                style: darkBlueTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    nik(String nik) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomor Induk Karyawan",
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              nik,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    namaLengkap(String name) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              name,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    departemen(String departemen) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Departemen",
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              departemen,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    jenisKelamin(String jenisKelamin) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jenis Kelamin",
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              jenisKelamin,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    tanggalLahir(String tanggalLahir) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tanggal Lahir",
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              tanggalLahir,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    email(String email) {
      return Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              email,
              // "${user.users.email}",
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    buttonLogout() {
      return FilledButton(
        onTap: () {},
        label: isLoading
            ? const IsLoading()
            : Text(
                "Logout",
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
        backgroundColor: darkBlueColor,
      );
    }

    return FutureBuilder(
      future: UserService().getUser(auth.token!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                PercentIndicator(),
              ],
            ),
          );
        }
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: header(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileTitle(),
                ...snapshot.data!.map((user) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nik(
                        user.nik.toString(),
                      ),
                      namaLengkap(user.name!),
                      departemen(user.departemen!.deptName!),
                      jenisKelamin(user.jenisKelamin!),
                      tanggalLahir(
                        DateFormat("d MMMM yyy").format(user.tanggalLahir!),
                      ),
                      email(user.email!),
                      buttonLogout(),
                    ],
                  );
                })
              ],
            ),
          ),
        );
      },
    );
  }
}
