import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:anime_app/widgets/tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController scrollController = ScrollController();

  List<String> assets = [
    
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
    'assets/image-6.jpg',
    'assets/image-7.jpg',
    'assets/image-8.jpg',
    'assets/image-9.jpg',
    'assets/image-10.jpg',
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
    'assets/image-6.jpg',
    'assets/image-7.jpg',
    'assets/image-8.jpg',
    'assets/image-9.jpg',
    'assets/image-10.jpg',
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
    'assets/image-6.jpg',
    'assets/image-7.jpg',
    'assets/image-8.jpg',
    'assets/image-9.jpg',
    'assets/image-10.jpg',
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
    'assets/image-6.jpg',
    'assets/image-7.jpg',
    'assets/image-8.jpg',
    'assets/image-9.jpg',
    'assets/image-10.jpg',
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
    'assets/image-6.jpg',
    'assets/image-7.jpg',
    'assets/image-8.jpg',
    'assets/image-9.jpg',
    'assets/image-10.jpg',
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
    'assets/image-6.jpg',
    'assets/image-7.jpg',
    'assets/image-8.jpg',
    'assets/image-9.jpg',
    'assets/image-10.jpg',
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
    'assets/image-6.jpg',
    'assets/image-7.jpg',
    'assets/image-8.jpg',
    'assets/image-9.jpg',
    'assets/image-10.jpg',
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
    'assets/image-6.jpg',
    'assets/image-7.jpg',
    'assets/image-8.jpg',
    'assets/image-9.jpg',
    'assets/image-10.jpg',
  ];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 00004), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: assets.length * 10),
        curve: Curves.linear,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: MasonryGridView.count(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
                itemCount: assets.length,
                //crossAxisCountBuilder: (int index) =>
                //    index.isEven ? 4 : 2, // Adjust this logic as needed
                itemBuilder: (BuildContext context, int index) {
                  return Image(
                    image: AssetImage(assets[index]),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(1),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: FadeInUp(
                        child: Text(
                          "Enjoy Anime Verse",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.actor(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (ctx) => const TabsScreen(),
                          ),
                        );
                      },
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/100.jpg"),
                        ),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 700),
                      child: Text(
                        "Sahil Dhargave",
                        style: GoogleFonts.actor(
                            color: Colors.white, fontSize: 17),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 900),
                      child: Text(
                        "",
                        style: GoogleFonts.actor(
                            color: Colors.grey[300], fontSize: 15),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 1000),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          Text(
                            "@sahil",
                            style: GoogleFonts.actor(
                                color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
