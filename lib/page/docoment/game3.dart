import 'package:cocola_jems/page/docoment/game_menu.dart';
import 'package:cocola_jems/page/telescope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../src/my_app.dart';
import '../start.dart';

class Game3 extends StatefulWidget {
  const Game3({Key? key}) : super(key: key);

  @override
  State<Game3> createState() => _Game3State();
}

class _Game3State extends State<Game3> {

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
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/bg/game3_bg.jpg"
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: const Game3D()
    );
  }
}

class Game3D extends StatelessWidget {
  const Game3D({Key? key}) : super(key: key);

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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => GameMenu()));
            },
            child: Image.asset(
              "assets/icon/back.png",
              height: .1*MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children:[
                 GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => PuzzleStart()));
                        },
                        child: Image.asset(
                          "assets/icon/start.png",
                          height: .6*MediaQuery.of(context).size.height,
                        ),
                 ),
                  ],
                ),
              ),
      ],
    );
  }
}
