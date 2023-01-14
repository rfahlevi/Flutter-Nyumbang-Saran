import 'package:flutter/material.dart';
import 'package:nyumbang_saran/widgets/button.dart';
import 'package:nyumbang_saran/widgets/themes.dart';

class UbahSaranPage extends StatefulWidget {
  const UbahSaranPage({super.key});

  @override
  State<UbahSaranPage> createState() => _UbahSaranPageState();
}

class _UbahSaranPageState extends State<UbahSaranPage> {
  String? dropDownValue;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<String> listDepartemen = [
      "IT",
      "HRD",
      "PRODUKSI",
      "GUDANG",
      "LAIN-LAIN"
    ];

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: blueColor,
        centerTitle: true,
        title: Text(
          "Ubah Sumbang Saran",
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    kodeSumbangSaran() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kode Sumbang Saran",
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
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                        hintText: "SS-01",
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

    nomorIndukKaryawan() {
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
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                        hintText: "220606011",
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

    namaLengkap() {
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
                      enabled: false,
                      decoration: InputDecoration.collapsed(
                        hintText: "Reza Fahlevi",
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

    departemen() {
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
                      "Pilih Departemen",
                      style: greyTextStyle,
                    ),
                    value: dropDownValue,
                    items: listDepartemen.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value!;
                      });
                    },
                  ),
                )),
          ],
        ),
      );
    }

    kondisiSaatIni() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kondisi Saat Ini",
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
                      minLines: 6,
                      maxLines: 12,
                      decoration: InputDecoration.collapsed(
                        hintText:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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

    usulanAnda() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Usulan Anda",
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
                      minLines: 6,
                      maxLines: 12,
                      decoration: InputDecoration.collapsed(
                        hintText:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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

    unggahFile() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Unggah File (optional | Maks. 2MB)",
              style: greyTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                  ),
                  child: Text(
                    "Pilih File",
                    style: whiteTextStyle,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "sumbangsaran.pdf",
                  style: blackTextStyle.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    simpan() {
      return FilledButton(
          onTap: () {},
          label: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(whiteColor),
                      strokeWidth: 2,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Loading..",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    )
                  ],
                )
              : Text(
                  "Buat Akun",
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
          backgroundColor: darkBlueColor);
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kodeSumbangSaran(),
              nomorIndukKaryawan(),
              namaLengkap(),
              departemen(),
              kondisiSaatIni(),
              usulanAnda(),
              unggahFile(),
              simpan(),
            ],
          ),
        ),
      ),
    );
  }
}
