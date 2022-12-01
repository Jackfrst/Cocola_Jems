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

import '../../generated/l10n.dart';
import '../../page/docoment/game1.dart';
import '../../src/ui/global/controllers/theme_controller.dart';
import '../../src/ui/global/widgets/my_icon_button.dart';
import '../../src/ui/global/widgets/my_text_icon_button.dart';
import '../../src/ui/icons/puzzle_icons.dart';
import '../../src/ui/pages/game/controller/game_controller.dart';
import '../../utils/color_utils.dart';
import '../iquiz/progress_bar.dart';
import '../iquiz/question_card.dart';
import '../iquiz/question_controller.dart';
import '../quiz/progress_bar.dart';

class IGameView extends StatefulWidget {
  const IGameView({Key? key}) : super(key: key);

  @override
  State<IGameView> createState() => _IGameViewState();
}

class _IGameViewState extends State<IGameView> {

  IQuestionController _iquestionController = Get.put(IQuestionController());
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft]);
    super.dispose();
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
    _iquestionController.onInit();
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
    final buttonHeight = responsive.dp(3).clamp(kMinInteractiveDimension, 100).toDouble();
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  _idisposeOrientation();
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) => Game1()));
                                },
                                child: Icon(Icons.arrow_back_ios),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white.withOpacity(0.2),
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
                                    iconData: controller.state.sound ? PuzzleIcons.sound : PuzzleIcons.mute,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Consumer<ThemeController>(
                              builder: (_, controller, __) => MyIconButton(
                                onPressed: controller.toggle,
                                iconData: controller.isDarkMode ? PuzzleIcons.dark_mode : PuzzleIcons.brightness,
                              ),
                            ),

                            //QGameAppBar(),

                            const SizedBox(width: 25),

                            //ICON
                            if (context.isDarkMode)
                              Container(
                                height: 0.09*MediaQuery.of(context).size.height,
                                child: Image.asset(
                                  "assets/img/team_kryptonite.png",
                                  color: Colors.white70,
                                ),
                              )
                            else
                              Container(
                                height: 0.09*MediaQuery.of(context).size.height,
                                child: Image.asset(
                                  "assets/img/team_kryptonite.png",
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    //QGameAppBar(),

                    //ProgressBar
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: iProgressBar(),
                    ),
                    SizedBox(height: kDefaultPadding / 2),

                    //Question No
                    Obx(
                      () => Text.rich(
                        TextSpan(
                          text:
                              "Question ${_iquestionController.iquestionNumber.value}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: kSecondaryColor),
                          children: [
                            TextSpan(
                              text: "/${_iquestionController.iquestions.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: kSecondaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Questions
                    Expanded(
                      child: PageView.builder(
                        // Block swipe to next qn
                        physics: NeverScrollableScrollPhysics(),
                        controller: _iquestionController.ipageController,
                        onPageChanged: _iquestionController.iupdateTheQnNum,
                        itemCount: _iquestionController.iquestions.length,
                        itemBuilder: (context, index) => IQuestionCard(
                            iquestion: _iquestionController.iquestions[index]
                        ),
                      ),
                    ),
                    // const QGameButtons(),


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
                            onPressed: _iquestionController.inextQuestion,
                            icon: const Icon(
                              Icons.skip_next,
                            ),
                            label: "SKIP",
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

_idisposeOrientation(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ],);
}
