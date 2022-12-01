import 'package:cocola_jems/page/docoment/game_menu.dart';
import 'package:cocola_jems/page/telescope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../game/img_app.dart';
import '../../src/my_app.dart';
import '../start.dart';

class Game1 extends StatefulWidget {
  const Game1({Key? key}) : super(key: key);

  @override
  State<Game1> createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/bg/game1_bg.jpg"
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 0.077*MediaQuery.of(context).size.height,
            left: 0.01*MediaQuery.of(context).size.width,
            bottom: 0.8*MediaQuery.of(context).size.height,
            right: 0.87*MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => GameMenu()));
              },
              child: Image.asset(
                "assets/icon/back.png",
                height: .1*MediaQuery.of(context).size.height,
              ),
            ),
          ),
          SafeArea(
            child:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ImgQuizStart());
                    },
                    child: Image.asset(
                      "assets/icon/start.png",
                      height: .6*MediaQuery.of(context).size.height,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}