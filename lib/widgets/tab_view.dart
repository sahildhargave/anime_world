import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:anime_app/Screens/category_screen.dart';
import 'package:anime_app/Screens/home.dart';
import 'package:anime_app/widgets/drawer_src.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Row(
              children: [
                Text(
                  'Anime',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText(
                      'Wall',
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RotateAnimatedText(
                      'Villa',
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RotateAnimatedText(
                      'Be',
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottom: TabBar(
              indicator: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Set the indicator color
              ),
              indicatorColor: Colors
                  .transparent, // Set to transparent to use custom BoxDecoration
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.category),
                ),
              ],
            ),
          ),
          drawer: const DrawerScreen(),
          body: const TabBarView(children: [
            HomePage(),
            CategoryScreen(),
          ]),
        ));
  }
}
