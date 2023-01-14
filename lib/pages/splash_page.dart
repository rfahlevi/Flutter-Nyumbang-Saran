import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nyumbang_saran/pages/login_page.dart';
import 'package:nyumbang_saran/widgets/themes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    splashPage();
  }

  splashPage() async {
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Center(
          child: Image.asset(
            'assets/icon_logo_splash.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
