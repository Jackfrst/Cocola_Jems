import 'package:flutter/material.dart';
import 'package:cocola_jems/src/ui/pages/game/game_view.dart';
import 'package:cocola_jems/src/ui/pages/privacy/privacy_view.dart';
import 'package:cocola_jems/src/ui/pages/splash/splash_view.dart';
import 'package:cocola_jems/src/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (_) => const SplashView(),
    Routes.game: (_) => const GameView(),
    Routes.privacy: (_) => const PrivacyView(),
  };
}
