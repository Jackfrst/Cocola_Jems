import 'package:cocola_jems/page/telescope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../start.dart';
import 'game1.dart';
import 'game2.dart';
import 'game3.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/bg/game_bg.jpg"
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: const GameMenuD()
    );
  }
}

class GameMenuD extends StatelessWidget {
  const GameMenuD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.08*MediaQuery.of(context).size.height,
          left: 0.03*MediaQuery.of(context).size.width,
          bottom: 0.7*MediaQuery.of(context).size.height,
          right: 0.85*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.to(() => Start(), transition:Transition.native,duration: Duration(seconds: 1));
            },
            child: Image.asset(
              "assets/icon/back.png",
              height: .1*MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Positioned(
          top: 0.45*MediaQuery.of(context).size.height,
          bottom: 0.15*MediaQuery.of(context).size.height,
          left: 0.05*MediaQuery.of(context).size.width,
          right: 0.65*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.to(() => Game1(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
            },
            child: Image.asset(
              "assets/icon/game1.png",
              height: .35*MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Positioned(
          top: 0.2*MediaQuery.of(context).size.height,
          left: 0.40*MediaQuery.of(context).size.width,
          right: 0.40*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.to(() => Game2(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
            },
            child: Image.asset(
              "assets/icon/game2.png",
              height: .35*MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Positioned(
          top: 0.5*MediaQuery.of(context).size.height,
          bottom: 0.2*MediaQuery.of(context).size.height,
          left: 0.65*MediaQuery.of(context).size.width,
          right: 0.05*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.to(() => Game3(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
            },
            child: Image.asset(
              "assets/icon/game3.png",
              height: .35*MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ],
    );
  }
}
