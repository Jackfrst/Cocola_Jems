import 'package:cocola_jems/page/docoment/doc_menu.dart';
import 'package:cocola_jems/page/docoment/game_menu.dart';
import 'package:cocola_jems/page/telescope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage(
    "assets/bg/start1.png"
        ),
      fit: BoxFit.fill,
      ),
    ),
    child: const StartD()
    );
  }
}

class StartD extends StatelessWidget {
  const StartD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30,top: 30),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Telescope()));
            },
            child: Image.asset(
              "assets/icon/back.png",
              height: .2*MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               GestureDetector(
                    onTap: () {
                      Get.to(() => DocMenu(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
                    },
                    child: Image.asset(
                      "assets/icon/Study.png",
                      height: .5*MediaQuery.of(context).size.height,
                    ),
                  ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => GameMenu(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
                    },
                    child: Image.asset(
                      "assets/icon/game.png",
                      height: .55*MediaQuery.of(context).size.height,
                    ),
                  ),
              ],
          ),
      ],
    );
  }
}
