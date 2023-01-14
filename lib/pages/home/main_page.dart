import 'package:flutter/material.dart';
import 'package:nyumbang_saran/pages/home/akun_page.dart';
import 'package:nyumbang_saran/pages/home/buat_saran.dart';
import 'package:nyumbang_saran/pages/home/home_page.dart';
import 'package:nyumbang_saran/pages/home/panduan_page.dart';
import 'package:nyumbang_saran/pages/home/penilaian_page.dart';
import 'package:nyumbang_saran/provider/page_provider.dart';
import 'package:nyumbang_saran/widgets/themes.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    floatingAction() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const BuatSaranPage();
              },
            ),
          );
        },
        backgroundColor: darkBlueColor,
        child: Icon(
          Icons.add_rounded,
          size: 30,
          color: whiteColor,
        ),
      );
    }

    customNavbar() {
      return BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: lightBlueColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            onTap: (value) {
              setState(() {
                pageProvider.currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                  color: pageProvider.currentIndex == 0
                      ? darkBlueColor
                      : blueColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Icon(
                    Icons.book_online_rounded,
                    size: 30,
                    color: pageProvider.currentIndex == 1
                        ? darkBlueColor
                        : blueColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Icon(
                    Icons.list_rounded,
                    size: 30,
                    color: pageProvider.currentIndex == 2
                        ? darkBlueColor
                        : blueColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.person_rounded,
                  size: 30,
                  color: pageProvider.currentIndex == 3
                      ? darkBlueColor
                      : blueColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const PenilaianPage();
        case 2:
          return const PanduanPage();
        case 3:
          return const AkunPage();

        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      floatingActionButton: floatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customNavbar(),
      body: body(),
    );
  }
}
