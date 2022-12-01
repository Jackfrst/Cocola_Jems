import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cocola_jems/src/data/repositories_impl/images_repository_impl.dart';
import 'package:cocola_jems/src/ui/pages/splash/circle_transition_clipper.dart';
import 'package:cocola_jems/src/ui/utils/colors.dart';
import 'package:cocola_jems/src/ui/utils/dark_mode_extension.dart';
import 'package:cocola_jems/src/ui/utils/responsive.dart';

import '../image_quiz/img_game_view.dart';

class SplashView3 extends StatefulWidget {
  const SplashView3({Key? key}) : super(key: key);

  @override
  _SplashView3State createState() => _SplashView3State();
}

class _SplashView3State extends State<SplashView3> with SingleTickerProviderStateMixin {
  late AnimationController _acontroller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _acontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _acontroller,
      curve: Curves.elasticIn,
    );
    _acontroller.forward();
    _acontroller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Timer(
            const Duration(seconds: 1),
            _goToGame,
          );
        }
      },
    );
    _setDeviceOrientation();
  }


  void _goToGame() {
    final route = PageRouteBuilder(
      pageBuilder: (_, animation, secondaryAnimation) => const IGameView(),
      transitionDuration: const Duration(milliseconds: 1500),
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        final size = MediaQuery.of(context).size;

        final radiusTween = Tween<double>(
          begin: 0.0,
          end: size.height,
        );

        return ClipPath(
          clipper: CircleTransitionClipper(
            center: Offset(
              size.width * 0.5,
              size.height * 0.5,
            ),
            radius: animation.drive(radiusTween).value,
          ),
          child: child,
        );
      },
    );
    Navigator.pushReplacement(context, route);
  }

  void _setDeviceOrientation() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // The equivalent of the "smallestWidth" qualifier on Android.
        var shortestSide = MediaQuery.of(context).size.shortestSide;

        // Determine if we should use mobile layout or not, 600 here is
        // a common breakpoint for a typical 7-inch tablet.
        final bool useMobileLayout = shortestSide < 600;
        if (useMobileLayout) {
          SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitDown,
              DeviceOrientation.portraitUp,
            ],
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _acontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final options = elementOption.getRange(
      1,
      elementOption.length,
    );

    final half = options.length ~/ 2;
    final responsive = Responsive.of(context);

    return Scaffold(
      backgroundColor: context.isDarkMode ? darkColor : lightColor2,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: OrientationBuilder(
          builder: (_, orientation) {
            final isPortrait = orientation == Orientation.portrait;

            final size = responsive.dp(isPortrait ? 10 : 7);
            final bottom = responsive.hp(30);
            final titleSize = responsive.dp(5);

            return AnimatedBuilder(
              animation: _animation,
              builder: (_, jungle) {
                final offset = _animation.value;
                final dx = -size * 0.3 - (size * 0.7 - offset * size * 0.7);

                return Stack(
                  children: [
                    Positioned(
                      bottom: -100 + (offset * 100),
                      left: 0,
                      right: 0,
                      child: jungle!,
                    ),
                    Center(
                      child: Transform.scale(
                        scale: offset.clamp(0.5, 1),
                        child: Opacity(
                          opacity: offset.clamp(0, 1),
                          child: Text(
                            "Space\nImage",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                              height: 0.9,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ...List.generate(
                      half,
                      (index) {
                        final dy = bottom + (size * 1.1 * index);
                        return Positioned(
                          left: dx,
                          bottom: dy,
                          child: Transform.rotate(
                            angle: 15 * math.pi / 180,
                            child: Image.asset(
                              options.elementAt(index).assetPath,
                              width: size,
                            ),
                          ),
                        );
                      },
                    ),
                    ...List.generate(
                      half,
                      (index) {
                        final dy = bottom + (size * 1.1 * index);
                        return Positioned(
                          right: dx,
                          bottom: dy,
                          child: Transform.rotate(
                            angle: -15 * math.pi / 180,
                            child: Image.asset(
                              options.elementAt(index + half).assetPath,
                              width: size,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
              child: Transform.rotate(
                angle: math.pi,
                child: Image.asset(
                  'assets/images/jungle.png',
                  width: double.infinity,
                  //color: Colors.primaries[8].withOpacity(0.3),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
