import 'package:flutter/material.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      percent: 1,
      radius: 22,
      animationDuration: 1000,
      footer: Text(
        "Sedang memuat data",
        style: blackTextStyle,
      ),
      animation: true,
      backgroundColor: whiteColor,
      progressColor: blueColor,
      animateFromLastPercent: true,
      restartAnimation: true,
    );
  }
}
