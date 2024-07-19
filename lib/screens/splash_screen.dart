import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/constants/colors.dart';
import 'package:trackizer/screens/home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 8000,
      splash: Image.asset("assets/svgImages/logo.png"),
      nextScreen: Home(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: whiteColor,
    );
  }
}
