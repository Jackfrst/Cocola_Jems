import 'package:audioplayers/audioplayers.dart';
import 'package:cocola_jems/screen/singin.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

import 'package:cocola_jems/page/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
        splash: Lottie.asset('assets/gif/splash.json'),
        screenFunction: () async{
          return SplashScreenName();
        },
        splashIconSize: .8 *MediaQuery.of(context).size.height,
        duration: 2400,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        animationDuration: const Duration(seconds: 1),
        backgroundColor: Colors.white,
    );
  }
}

class SplashScreenName extends StatelessWidget {
  const SplashScreenName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
        splash: Image.asset('assets/img/team_kryptonite.png'),
        screenFunction: () async{
          return SingIn();
        },
        splashIconSize: .8 *MediaQuery.of(context).size.height,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        animationDuration: const Duration(seconds: 1),
        backgroundColor: Colors.white,
    );
  }
}
