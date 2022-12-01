import 'package:cocola_jems/page/telescope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../start.dart';
import 'doc1.dart';
import 'doc2.dart';
import 'doc3.dart';
import 'game_menu.dart';

class DocMenu extends StatefulWidget {
  const DocMenu({Key? key}) : super(key: key);

  @override
  State<DocMenu> createState() => _DocMenuState();
}

class _DocMenuState extends State<DocMenu> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/bg/doc_menu.jpg"
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: const DocMenuD()
    );
  }
}

class DocMenuD extends StatelessWidget {
  const DocMenuD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.08*MediaQuery.of(context).size.height,
          left: 0.03*MediaQuery.of(context).size.width,
          bottom: 0.7*MediaQuery.of(context).size.height,
          right: 0.85*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.to(() => Start(), transition:Transition.native,duration: Duration(seconds: 1));
            },
            child: Image.asset(
              "assets/icon/back.png",
              height: .1*MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Positioned(
          top: 0.5*MediaQuery.of(context).size.height,
          left: 0.1*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.to(() => Doc1(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
            },
            child: Image.asset(
              "assets/icon/doc1.png",
              height: .35*MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Positioned(
          top: 0.2*MediaQuery.of(context).size.height,
          left: 0.40*MediaQuery.of(context).size.width,
          right: 0.40*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.to(() => Doc2(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
            },
            child: Image.asset(
              "assets/icon/doc2.png",
              height: .35*MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Positioned(
          top: 0.5*MediaQuery.of(context).size.height,
          right: 0.1*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.to(() => Doc3(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
            },
            child: Image.asset(
              "assets/icon/doc3.png",
              height: .35*MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ],
    );
  }
}
