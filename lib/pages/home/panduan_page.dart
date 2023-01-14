import 'package:flutter/material.dart';
import 'package:nyumbang_saran/widgets/themes.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    title() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Center(
          child: Text(
            "Panduan Aplikasi",
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cara membuat sumbang saran :",
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "1. Lengkapi profil anda di menu akun \n2. Kembali ke halaman utama , lalu klik tombol + dibagian bawah atau klik tombol 'Buat Saran' di bagian atas \n3. Isi form sumbang saran secara lengkap \n4.Klik tombol simpan",
            style: blackTextStyle,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Ketentuan :",
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "1. User harus melengkapi profil pengguna agar bisa membuat sumbang saran \n2. Unggah file pada form sumbang saran dibuat secara optional (boleh diisi atau tidak) \n3. File harus berupa format pdf, jpg, jpeg, png (Maks. 2MB)",
            style: blackTextStyle,
          ),
        ],
      );
    }

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            content(),
          ],
        ),
      ),
    ));
  }
}
