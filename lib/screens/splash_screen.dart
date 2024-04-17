import 'package:flutter/material.dart';
import 'package:engaz/screens/login&Register/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class Splash_screen extends StatelessWidget {
  const Splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      duration: 1000,
      splash: Image.asset('assets/images/engz.png'),
      nextScreen: loginScreen(),
      splashIconSize: 150,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,

    );
  }
}
