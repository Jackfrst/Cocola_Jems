import 'package:flutter/material.dart';
import 'package:cocola_jems/src/ui/global/controllers/theme_controller.dart';
import 'package:cocola_jems/src/ui/global/widgets/my_icon_button.dart';
import 'package:cocola_jems/src/ui/icons/puzzle_icons.dart';
import 'package:cocola_jems/src/ui/pages/game/controller/game_controller.dart';
import 'package:cocola_jems/src/ui/utils/dark_mode_extension.dart';
import 'package:cocola_jems/src/ui/utils/platform.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../page/docoment/game3.dart';
import '../../../../../page/docoment/game_menu.dart';

const whiteFlutterLogoColorFilter = ColorFilter.matrix(
  [1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0],
);

class GameAppBar extends StatelessWidget {
  const GameAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logo = isIOS
        ? const Icon(
            PuzzleIcons.heart,
            color: Colors.redAccent,
            size: 30,
          )
        : const FlutterLogo(
            size: 40,
          );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _disposeOrientation();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Game3()));
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
            const SizedBox(width: 25),
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
    );
  }
}

_disposeOrientation(){
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight
  ],);
}
