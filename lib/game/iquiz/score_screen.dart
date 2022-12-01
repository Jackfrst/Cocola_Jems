import 'package:cocola_jems/game/quiz/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../page/docoment/game_menu.dart';
import '../../utils/color_utils.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: _questionController.reset,

        elevation: 10,
        highlightElevation: 10,
        child: const Icon(Icons.reset_tv_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
          fit: StackFit.expand,
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
              top: 0.0001*MediaQuery.of(context).size.height,
              left: 0.0001*MediaQuery.of(context).size.width,
              bottom: 0.0001*MediaQuery.of(context).size.height,
              right: 0.0001*MediaQuery.of(context).size.width,
              child: Image.asset(
                  "assets/icon/scroll.png",
                  height: .1*MediaQuery.of(context).size.height,
                ),
            ),
            Column(
              children: [
                Spacer(flex: 3),
                Text(
                    "Score",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: kBlackColor),
                ),

                
                Spacer(),
                Text(
                  "${_questionController.numOfCorrectAns * 10}/${_questionController.questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: kBlackColor),
                ),
                Spacer(flex: 3),
              ],
            ),
            Positioned(
              top: 0.08*MediaQuery.of(context).size.height,
              left: 0.03*MediaQuery.of(context).size.width,
              bottom: 0.7*MediaQuery.of(context).size.height,
              right: 0.85*MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  _questionController.checkout();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => GameMenu()));
                },
                child: Image.asset(
                  "assets/icon/back.png",
                  height: .1*MediaQuery.of(context).size.height,
                ),
              ),
            ),
          ],
      ),
    );
  }
}
