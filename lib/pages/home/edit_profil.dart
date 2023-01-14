import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyumbang_saran/models/user_model.dart';
import 'package:nyumbang_saran/provider/auth_provider.dart';
import 'package:nyumbang_saran/provider/departemen_provider.dart';
import 'package:nyumbang_saran/provider/user_provider.dart';
import 'package:nyumbang_saran/services/const.dart';
import 'package:nyumbang_saran/widgets/button.dart';
import 'package:nyumbang_saran/widgets/isloading.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({super.key});

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  bool isLoading = false;
  int? valueDepartemen;
  String? valueJenisKelamin;
  DateTime? tglLahir;
  String baseUrl = apiUrl;
  File? image;
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  TextEditingController nikController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future getImage() async {
    var img = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(img!.path);
    });
  }

  @override
  void initState() {
    DepartemenProvider departemenProvider =
        Provider.of<DepartemenProvider>(context, listen: false);
    departemenProvider.getDepartemens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel authUser = authProvider.user;
    DepartemenProvider departemenProvider =
        Provider.of<DepartemenProvider>(context);
    UserProvider user = Provider.of<UserProvider>(context);

    updateUser() async {
      setState(() {
        isLoading = true;
      });
      if (await user.updateUser(
        image.toString(),
        int.parse(nikController.text),
        nameController.text,
        valueJenisKelamin!,
        emailController.text,
        authUser.token!,
        valueDepartemen!,
        tglLahir!,
        image!.path,
        image!.path,
      )) {
        Get.snackbar(
          "Berhasil",
          "Profile berhasil diupdate",
          backgroundColor: blueColor,
          colorText: whiteColor,
        );
        setState(() {
          isLoading = false;
          image = null;
          nikController.text = '';
          nameController.text = '';
          emailController.text = '';
          Get.offAllNamed('/main');
        });
      }
    }

    List<String> listJenisKelamin = [
      "Pria",
      "Wanita",
    ];

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: blueColor,
        centerTitle: true,
        title: Text(
          "Edit Profil",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    nomorIndukKaryawan(String nik, TextStyle style) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomor Induk Karyawan",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: greyColor,
                  ),
                  color: const Color(0XFFFFFFFF)),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: nikController,
                      decoration: InputDecoration.collapsed(
                        hintText: nik,
                        hintStyle: style,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    namaLengkap(String name) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: greyColor,
                  ),
                  color: const Color(0XFFFFFFFF)),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration.collapsed(
                        hintText: name,
                        hintStyle: blackTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    email(String email) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: greyColor,
                  ),
                  color: const Color(0XFFFFFFFF)),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration.collapsed(
                        hintText: email,
                        hintStyle: blackTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    departemen(String departemen, TextStyle style) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Departemen",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0XFFFFFFFF),
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text(
                    departemen,
                    style: style,
                  ),
                  value: valueDepartemen,
                  items: departemenProvider.departemens.map((departemen) {
                    return DropdownMenuItem(
                      value: departemen.id,
                      child: Text(departemen.deptName.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      valueDepartemen = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    jenisKelamin(String jenisKelamin, TextStyle style) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jenis Kelamin",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0XFFFFFFFF),
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text(jenisKelamin, style: style),
                    value: valueJenisKelamin,
                    items: listJenisKelamin.map((String jenisKelamin) {
                      return DropdownMenuItem(
                          value: jenisKelamin, child: Text(jenisKelamin));
                    }).toList(),
                    onChanged: (jenisKelamin) {
                      setState(() {
                        valueJenisKelamin = jenisKelamin!;
                      });
                    },
                  ),
                )),
          ],
        ),
      );
    }

    tanggalLahir(String tanggalLahir, TextStyle style) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tanggal Lahir",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0XFFFFFFFF),
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                        hintText: tanggalLahir,
                        hintStyle: style,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(200),
                        lastDate: DateTime(2099),
                      ).then((value) {
                        setState(() {
                          tglLahir = value;
                        });
                      });
                    },
                    child: Icon(
                      Icons.date_range_rounded,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    unggahFotoProfile() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Unggah Foto Profile (optional | Maks. 1MB)",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: getImage,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(12)),
                    child: (image == null)
                        ? Icon(
                            Icons.image_rounded,
                            color: greyColor,
                            size: 50,
                          )
                        : Image.file(File(image!.path)),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ],
        ),
      );
    }

    simpan() {
      return FilledButton(
        onTap: () {
          updateUser();
        },
        label: isLoading
            ? const IsLoading()
            : Text(
                "Simpan",
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
        backgroundColor: darkBlueColor,
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: user.listUsers.map((user) {
                return Column(
                  children: [
                    unggahFotoProfile(),
                    nomorIndukKaryawan(
                      //NIK
                      user.nik == null
                          ? "Nomor Induk Karyawan"
                          : user.nik.toString(),
                      //Style
                      user.nik == null ? greyTextStyle : blackTextStyle,
                    ),
                    namaLengkap(user.name == null
                        ? "Masukkan Nama Lengkap Anda"
                        : user.name!),
                    email(user.email == null
                        ? "Masukkan Email Anda"
                        : user.email!),
                    departemen(
                      //Departemen
                      user.departemen == null
                          ? "Pilih Departemen"
                          : user.departemen!.deptName!,
                      //Style
                      user.departemen == null ? greyTextStyle : blackTextStyle,
                    ),
                    jenisKelamin(
                      //Jenis Kelamin
                      user.jenisKelamin == null
                          ? "Pilih Jenis Kelamin"
                          : user.jenisKelamin!,
                      //Style
                      user.jenisKelamin == null
                          ? greyTextStyle
                          : blackTextStyle,
                    ),
                    tanggalLahir(
                      //Tanggal Lahir
                      tglLahir == null
                          ? "Pilih Tanggal Lahir"
                          : DateFormat("d MMMM yyyy").format(tglLahir!),
                      //Style
                      tglLahir == null ? greyTextStyle : blackTextStyle,
                    ),
                    simpan(),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
