// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyumbang_saran/models/saran_model.dart';
import 'package:nyumbang_saran/pages/home/detail_saran.dart';
import 'package:nyumbang_saran/widgets/themes.dart';

class CardSaran extends StatelessWidget {
  final SaranModel saran;
  const CardSaran({super.key, required this.saran});
  // String labelNoSaran;
  // String labelSaran;
  // bool isChecked;
  // CardSaran({
  //   super.key,
  //   required this.labelNoSaran,
  //   required this.labelSaran,
  //   this.isChecked = false,
  // });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailSaran(saran: saran));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: greyColor,
              offset: const Offset(1, 2),
              spreadRadius: 0,
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: greyColor),
          color: const Color(0XFFFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "No Sumbang Saran :",
                  style: greyTextStyle,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  saran.noSaran!,
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Saran :",
              style: greyTextStyle,
            ),
            Text(
              saran.usulan!,
              style: blackTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  "Status :",
                  style: greyTextStyle,
                ),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: lightBlueColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Belum diperiksa",
                    style: whiteTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
