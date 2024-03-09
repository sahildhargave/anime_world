import 'package:anime_app/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import '../controllers/mainscreen_provider.dart';

class BottoNavBar extends StatelessWidget {
  const BottoNavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDataProvider>(
      builder: (context, getDataProvider, child) {
        int pageIndex = getDataProvider.pageIndex;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BotomNavWidget(
                    onTap: () {
                      // Handle the onTap logic for the home page
                    },
                    icon: pageIndex == 0
                        ? MaterialCommunityIcons.home
                        : MaterialCommunityIcons.home_outline,
                  ),
                  BotomNavWidget(
                    onTap: () {
                      // Handle the onTap logic for the search page
                    },
                    icon: pageIndex == 1 ? Ionicons.search : Ionicons.search,
                  ),
                  BotomNavWidget(
                    onTap: () {
                      // Handle the onTap logic for the add page
                    },
                    icon: pageIndex == 2
                        ? Ionicons.add
                        : Ionicons.add_circle_outline,
                  ),
                  BotomNavWidget(
                    onTap: () {
                      // Handle the onTap logic for the cart page
                    },
                    icon:
                        pageIndex == 3 ? Ionicons.cart : Ionicons.cart_outline,
                  ),
                  BotomNavWidget(
                    onTap: () {
                      // Handle the onTap logic for the profile page
                    },
                    icon: pageIndex == 4
                        ? Ionicons.person
                        : Ionicons.person_outline,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
