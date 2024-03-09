import 'package:anime_app/Screens/Navbar/ProfilePage.dart';
import 'package:anime_app/Screens/Navbar/SearchPage.dart';
import 'package:anime_app/Screens/home.dart';
import 'package:anime_app/controllers/mainscreen_provider.dart';
import 'package:anime_app/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Navbar/CartPage.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDataProvider>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: BottoNavBar(),
        );
      },
    );
  }
}
