import 'package:flutter/material.dart';
import 'package:nyumbang_saran/widgets/themes.dart';

class IsLoading extends StatelessWidget {
  const IsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: whiteColor,
            strokeWidth: 2,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "Loading..",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}
