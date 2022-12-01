import 'dart:async';

import 'package:cocola_jems/src/ui/pages/game/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cocola_jems/src/domain/models/move_to.dart';
import 'package:cocola_jems/src/ui/pages/game/widgets/winner_dialog.dart';
import 'package:cocola_jems/src/ui/utils/responsive.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../page/docoment/game1.dart';
import '../../page/docoment/game2.dart';
import '../../src/ui/global/controllers/theme_controller.dart';
import '../../src/ui/global/widgets/my_icon_button.dart';
import '../../src/ui/global/widgets/my_text_icon_button.dart';
import '../../src/ui/icons/puzzle_icons.dart';
import '../../src/ui/pages/game/controller/game_controller.dart';
import '../../utils/color_utils.dart';
import '../iquiz/question_controller.dart';
import '../quiz/question_controller.dart';

class IQScore extends StatefulWidget {
  const IQScore({Key? key}) : super(key: key);

  @override
  State<IQScore> createState() => _IQScoreState();
}

class _IQScoreState extends State<IQScore> {
  IQuestionController _iquestionController = Get.put(IQuestionController());
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    super.dispose();
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    super.initState();
  }

  void _onKeyBoardEvent(BuildContext context, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final moveTo = event.logicalKey.keyLabel.moveTo;
      if (moveTo != null) {
        context.read<GameController>().onMoveByKeyboard(moveTo);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final width = responsive.width;
    final buttonHeight =
        responsive.dp(3).clamp(kMinInteractiveDimension, 100).toDouble();
    return ChangeNotifierProvider(
      create: (_) {
        final controller = GameController();
        controller.onFinish.listen(
          (_) {
            Timer(
              const Duration(
                milliseconds: 200,
              ),
              () {
                showWinnerDialog(
                  context,
                  moves: controller.state.moves,
                  time: controller.time.value,
                );
              },
            );
          },
        );
        return controller;
      },
      builder: (context, child) => RawKeyboardListener(
        autofocus: true,
        includeSemantics: false,
        focusNode: FocusNode(),
        onKey: (event) => _onKeyBoardEvent(context, event),
        child: child!,
      ),
      child: GameBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: OrientationBuilder(
              builder: (_, orientation) {
                final isPortrait = orientation == Orientation.portrait;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //App bar
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            //Back
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  _iquestionController.icheckout();
                                  _disposeOrientation();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Game2()));
                                },
                                child: Icon(Icons.arrow_back_ios),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(70),
                                    //border radius equal to or more than 50% of width
                                  ),
                                ),
                              ),
                            ),

                            // Theme
                            const SizedBox(width: 15),
                            Consumer<GameController>(
                              builder: (_, controller, __) => Row(
                                children: [
                                  MyIconButton(
                                    onPressed: controller.toggleVibration,
                                    iconData: controller.state.vibration
                                        ? PuzzleIcons.vibration
                                        : PuzzleIcons.vibration_off,
                                  ),
                                  const SizedBox(width: 10),
                                  MyIconButton(
                                    onPressed: controller.toggleSound,
                                    iconData: controller.state.sound
                                        ? PuzzleIcons.sound
                                        : PuzzleIcons.mute,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 10),
                            Consumer<ThemeController>(
                              builder: (_, controller, __) => MyIconButton(
                                onPressed: controller.toggle,
                                iconData: controller.isDarkMode
                                    ? PuzzleIcons.dark_mode
                                    : PuzzleIcons.brightness,
                              ),
                            ),

                            //QGameAppBar(),

                            const SizedBox(width: 25),

                            //ICON
                            if (context.isDarkMode)
                              Container(
                                height:
                                    0.09 * MediaQuery.of(context).size.height,
                                child: Image.asset(
                                  "assets/img/team_kryptonite.png",
                                  color: Colors.white70,
                                ),
                              )
                            else
                              Container(
                                height:
                                    0.09 * MediaQuery.of(context).size.height,
                                child: Image.asset(
                                  "assets/img/team_kryptonite.png",
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: kDefaultPadding / 2),
                    //QGameAppBar(),

                    if (context.isDarkMode)
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(70),
                          child: Column(
                            children: [
                              Text(
                                "Score",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(color: Colors.blueGrey),
                              ),
                              Text(
                                  "${_iquestionController.inumOfCorrectAns * 10}/${_iquestionController.iquestions.length * 10}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(color: Colors.blueGrey)),
                            ],
                          ),
                        ),
                      )
                    else
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(70),
                          child: Column(
                            children: [
                              Text(
                                "Score",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(color: Colors.black87),
                              ),
                              Text(
                                "${_iquestionController.inumOfCorrectAns * 10}/${_iquestionController.iquestions.length * 10}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ),

                    //ProgressBar
                    SizedBox(height: kDefaultPadding / 2),

                    //Footer Button
                    Padding(
                      padding: const EdgeInsets.all(10).copyWith(
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20),
                          MyTextIconButton(
                            height: buttonHeight,
                            onPressed: () {
                              _iquestionController.icheckout();
                              _disposeOrientation();
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Game1()));
                            },
                            icon: const Icon(
                              Icons.replay_rounded,
                            ),
                            label: "Reset",
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

_disposeOrientation() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );
}
