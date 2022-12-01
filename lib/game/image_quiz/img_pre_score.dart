import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:cocola_jems/generated/l10n.dart';
import 'package:cocola_jems/game/routes/routes.dart';
import 'package:cocola_jems/game/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../../src/ui/global/controllers/theme_controller.dart';
import '../../src/ui/global/widgets/max_text_scale_factor.dart';

class IPreScore extends StatelessWidget {
  const  IPreScore ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (_, controller, __) => MaterialApp(
          builder: (_, page) => MaxTextScaleFactor(
            child: page!,
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('es'),
          ],
          debugShowCheckedModeBanner: false,
          themeMode: controller.themeMode,
          theme: controller.lightTheme,
          darkTheme: controller.darkTheme,
          initialRoute: QRoutes.iscore,
          routes: QuizRoutes,
        ),
      ),
    );
  }
}
