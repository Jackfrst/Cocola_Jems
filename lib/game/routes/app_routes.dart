import 'package:flutter/material.dart';
import 'package:cocola_jems/src/ui/pages/privacy/privacy_view.dart';
import 'package:cocola_jems/game/routes/routes.dart';

import '../game_view/qgame_view.dart';
import '../game_view/quiz_score.dart';
import '../image_quiz/img_game_view.dart';
import '../image_quiz/img_quiz_score.dart';
import '../splash/splash_view2.dart';
import '../splash/splash_view3.dart';

Map<String, Widget Function(BuildContext)> get QuizRoutes {
  return {
    QRoutes.splash: (_) => const SplashView2(),
    QRoutes.splash2: (_) => const SplashView3(),
    QRoutes.game: (_) => const QGameView(),
    QRoutes.qscore: (_) => const QScore(),
    QRoutes.igame: (_) => const IGameView(),
    QRoutes.iscore: (_) => const IQScore(),
    QRoutes.privacy: (_) => const PrivacyView(),
  };
}
