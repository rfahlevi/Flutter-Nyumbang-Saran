// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:nyumbang_saran/widgets/themes.dart';

class PenilaianPage extends StatelessWidget {
  const PenilaianPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        centerTitle: true,
        title: Column(
          children: [
            // Text(
            //   "Nilai tertinggi kamu",
            //   style: whiteTextStyle.copyWith(
            //     fontSize: 16,
            //     fontWeight: medium,
            //   ),
            // ),
            // const SizedBox(
            //   height: 4,
            // ),
            Text(
              "Coming Soon",
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      );
    }

    listPenilaian() {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No Sumbang Saran : SS-01",
                      style: blackTextStyle,
                    ),
                    Text(
                      "Nama : Reza Fahlevi",
                      style: blackTextStyle,
                    ),
                    Text(
                      "NIK : 220606011",
                      style: blackTextStyle,
                    ),
                  ],
                ),
                Text(
                  "988 Poin",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Divider(
              color: greyColor,
              thickness: 1,
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: header(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fitur Penilaian belum tersedia, masih dalam proses pengembangan",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ));
  }
}
