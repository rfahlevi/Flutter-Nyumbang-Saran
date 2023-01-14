import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyumbang_saran/provider/auth_provider.dart';
import 'package:nyumbang_saran/widgets/button.dart';
import 'package:nyumbang_saran/widgets/isloading.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:provider/provider.dart';

class BuatAkunPage extends StatefulWidget {
  const BuatAkunPage({super.key});

  @override
  State<BuatAkunPage> createState() => _BuatAkunPageState();
}

class _BuatAkunPageState extends State<BuatAkunPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isHide = false;
  bool isLoading = false;

  void togglePassword() {
    setState(() {
      isHide = !isHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    register() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Get.snackbar("Berhasil", "Akun berhasil dibuat");
        Get.offAllNamed('/main');

        setState(() {
          nameController.text = '';
          emailController.text = '';
          passwordController.text = '';
          isLoading = false;
        });
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Text(
                  "Register Gagal!",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
              content: Text(
                "Pastikan format email benar, dan email belum terdaftar",
                style: blackTextStyle,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Oke",
                          style: whiteTextStyle,
                        )),
                  ],
                )
              ],
            );
          },
        );

        setState(() {
          nameController.text = '';
          emailController.text = '';
          passwordController.text = '';
          isLoading = false;
        });
      }
    }

    title() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Text(
          "Buat Akun",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    namaLengkapInput() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: greyColor)),
        child: TextFormField(
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Nama Lengkap harus diisi";
            }

            return null;
          },
          style: blackTextStyle,
          decoration: InputDecoration.collapsed(
            hintText: 'Nama Lengkap',
            hintStyle: greyTextStyle,
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
          style: blackTextStyle,
          decoration: InputDecoration.collapsed(
            hintText: 'Email',
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
        child: Row(children: [
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
              style: blackTextStyle,
              obscureText: isHide ? true : false,
              decoration: InputDecoration.collapsed(
                hintText: 'Password',
                hintStyle: greyTextStyle,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              togglePassword();
            },
            child: Icon(
              isHide ? Icons.visibility_rounded : Icons.visibility_off_rounded,
              color: greyColor,
            ),
          )
        ]),
      );
    }

    buatAkun() {
      return FilledButton(
        onTap: () {
          if (formKey.currentState!.validate()) {
            register();
          }
        },
        label: isLoading
            ? const IsLoading()
            : Text(
                "Buat Akun",
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
            "Sudah punya akun?",
            style: greyTextStyle,
          ),
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed('/login');
            },
            child: Text(
              "Login",
              style: blueTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              title(),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    namaLengkapInput(),
                    emailInput(),
                    passwordInput(),
                    buatAkun(),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
