// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyumbang_saran/models/saran_model.dart';
import 'package:nyumbang_saran/models/user_model.dart';
import 'package:nyumbang_saran/pages/home/buat_saran.dart';
import 'package:nyumbang_saran/provider/auth_provider.dart';
import 'package:nyumbang_saran/provider/saran_provider.dart';
import 'package:nyumbang_saran/services/saran_service.dart';
import 'package:nyumbang_saran/widgets/card_saran.dart';
import 'package:nyumbang_saran/widgets/percent_indicator.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    UserModel auth = authProvider.user;
    SaranProvider saranProvider =
        Provider.of<SaranProvider>(context, listen: false);
    saranProvider.getSaran(auth.token!, auth.id!);
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel auth = authProvider.user;

    PreferredSizeWidget header() {
      return AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        automaticallyImplyLeading: false,
        backgroundColor: blueColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/image_profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Halo, ${auth.name}",
                      style: whiteTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      auth.email!,
                      style: whiteTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kamu telah menyumbang",
                        style: blackTextStyle,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "0",
                            style: blackTextStyle.copyWith(
                              fontSize: 32,
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Saran",
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const BuatSaranPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    child: Text(
                      "Buat Saran",
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 190,
      );
    }

    titleContent() {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Text(
          "Saran anda",
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
      );
    }

    emptyContent() {
      return Container(
        margin: const EdgeInsets.only(top: 100),
        child: Center(
          child: Text(
            "Belum ada sumbang saran, silahkan buat sumbang saran anda",
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: header(),
        body: FutureBuilder<List<SaranModel>?>(
          future: SaranService().getSaran(auth.token!, auth.id!),
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
            } else if (snapshot.hasData == false) {
              return emptyContent();
            } else if (snapshot.error == true) {
              Get.snackbar("Error", snapshot.error.toString());
            }

            return ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleContent(),
                      ...snapshot.data!.map((saran) {
                        return CardSaran(saran: saran);
                      })
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
