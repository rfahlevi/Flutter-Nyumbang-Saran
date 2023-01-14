import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyumbang_saran/pages/home/akun_page.dart';
import 'package:nyumbang_saran/pages/home/edit_profil.dart';
import 'package:nyumbang_saran/pages/home/home_page.dart';
import 'package:nyumbang_saran/pages/home/main_page.dart';
import 'package:nyumbang_saran/pages/home/panduan_page.dart';
import 'package:nyumbang_saran/pages/home/penilaian_page.dart';
import 'package:nyumbang_saran/pages/login_page.dart';
import 'package:nyumbang_saran/pages/register_page.dart';
import 'package:nyumbang_saran/pages/splash_page.dart';
import 'package:nyumbang_saran/provider/auth_provider.dart';
import 'package:nyumbang_saran/provider/departemen_provider.dart';
import 'package:nyumbang_saran/provider/page_provider.dart';
import 'package:nyumbang_saran/provider/saran_provider.dart';
import 'package:nyumbang_saran/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartemenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SaranProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/register': (context) => const BuatAkunPage(),
          '/login': (context) => const LoginPage(),
          '/main': (context) => const MainPage(),
          '/home': (context) => const HomePage(),
          '/penilaian': (context) => const PenilaianPage(),
          '/panduan': (context) => const PanduanPage(),
          '/akun': (context) => const AkunPage(),
          '/edit-profil': (context) => const EditProfilPage(),
        },
      ),
    );
  }
}
