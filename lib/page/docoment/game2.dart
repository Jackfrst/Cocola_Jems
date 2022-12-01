import 'package:cocola_jems/game/game_view/qgame_view.dart';
import 'package:cocola_jems/game/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cocola_jems/page/docoment/game_menu.dart';
import 'package:cocola_jems/utils/color_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Game2 extends StatefulWidget {
  const Game2({Key? key}) : super(key: key);

  @override
  State<Game2> createState() => _Game2State();
}

class _Game2State extends State<Game2> {
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
                    "assets/bg/game2_bg.jpg"
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => QuizStart()));
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

