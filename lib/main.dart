import 'package:flutter/material.dart';
import 'package:cocola_jems/src/inject_dependencies.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:cocola_jems/page/splash_s.dart';

import 'package:flutter/services.dart';

Future <void> main() async{
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp() ;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(                      //for navigation dont forget to use GetMaterialApp
      debugShowCheckedModeBanner: false,
      title: 'COCOLA JEMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen (),
      },
    );
  }
}
