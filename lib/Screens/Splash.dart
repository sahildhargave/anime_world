import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:anime_app/Screens/Navbar/MainScreen.dart';

import 'package:anime_app/widgets/tab_view.dart';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                child: AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText('AnimeVerse',
                      speed: const Duration(milliseconds: 200))
                ])),
          ],
        ),
      ),
    );
  }
}
