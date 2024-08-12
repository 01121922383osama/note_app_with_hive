import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:note_app_sat/Splash/Animated%20Splash/contains_splash.dart';
import 'package:note_app_sat/Splash/Introduction%20Splash/introduction_splash.dart';
import 'package:note_app_sat/customs/custom_color.dart';

class ScaffoldAnimatedSplash extends StatelessWidget {
  const ScaffoldAnimatedSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const ContainsSplash(),
      backgroundColor: kMainColor,
      nextScreen: const IntroductionSplash(),
      animationDuration: const Duration(milliseconds: 700),
      duration: 3000,
      splashIconSize: 500,
    );
  }
}
