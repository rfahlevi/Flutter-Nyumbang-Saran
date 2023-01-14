import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyumbang_saran/provider/auth_provider.dart';
import 'package:nyumbang_saran/widgets/button.dart';
import 'package:nyumbang_saran/widgets/isloading.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHide = false;
  bool isLoading = false;
  final fromKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePassword() {
    setState(() {
      isHide = !isHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    login() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        if (emailController.text.isEmail == true) {
          return true;
        } else {
          Get.snackbar("Terjadi Kesalahan", "Format email tidak sesuai");
          setState(() {
            isLoading = false;
          });
        }
      }
    }

    title() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Text(
          "Login",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    emailInput() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: greyColor)),
        child: TextFormField(
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email harus diisi";
            }

            return null;
          },
          decoration: InputDecoration.collapsed(
            hintText: 'Email anda',
            hintStyle: greyTextStyle,
          ),
        ),
      );
    }

    passwordInput() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 40),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: greyColor)),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password harus diisi";
                  } else if (value.length < 8) {
                    return "Password minimal 8 karakter";
                  }
                  return null;
                },
                obscureText: isHide ? true : false,
                decoration: InputDecoration.collapsed(
                  hintText: 'Password anda',
                  hintStyle: greyTextStyle,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                togglePassword();
              },
              child: isHide
                  ? Icon(
                      Icons.visibility_rounded,
                      color: greyColor,
                    )
                  : Icon(
                      Icons.visibility_off_rounded,
                      color: greyColor,
                    ),
            ),
          ],
        ),
      );
    }

    buttonLogin() {
      return FilledButton(
        onTap: () {
          if (fromKey.currentState!.validate()) {
            login();
          }
        },
        label: isLoading
            ? const IsLoading()
            : Text(
                "Login",
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
        backgroundColor: darkBlueColor,
      );
    }

    footer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Belum punya akun?",
            style: greyTextStyle,
          ),
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed('/register');
            },
            child: Text(
              "Buat Akun",
              style: blueTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      // bottomNavigationBar: footer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            title(),
            Form(
              key: fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  emailInput(),
                  passwordInput(),
                  buttonLogin(),
                ],
              ),
            ),
            const Spacer(),
            footer(),
          ],
        ),
      ),
    );
  }
}
