library animated_splash_screen;

import 'package:cocola_jems/page/shop.dart';
import 'package:cocola_jems/page/telescope.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_svg/svg.dart';

import 'about.dart';
import 'lead_brd.dart';
import 'live dart.dart';
import 'main_score.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg/home.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: HomeD(),
      ),
    );
  }
}

class HomeD extends StatefulWidget {
  const HomeD({Key? key}) : super(key: key);

  @override
  State<HomeD> createState() => _HomeDState();
}

class _HomeDState extends State<HomeD> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          PBTN(0, LeaderBoard(), context, .52, .38, .58, .226, .11, .2108,
              "assets/icon/led.png"),
          PBTN(0, Shop(), context, .5, .3, .276, .62, .109, .115,
              "assets/icon/shop.png"),
          PBTN(1, Live(), context, .38, .51, .25, .63, 0.11, .116,
              "assets/icon/live.png"),
          PBTN(1, Telescope(), context, .02, 0.883, .33, .3, 0.07, .02,
              "assets/icon/launch.png"),
          PBTN(1, About(), context, .7, .22, .1, .7, .11, .2108,
              "assets/icon/quiz.png"),
        ],
      ),
    );
  }
}

Widget PBTN(int status, Widget buttonfunc, BuildContext context, double btm,
    double tp, double rt, double lft, double btnh, double btnw, String txt) {
  return Positioned(
    top: tp * MediaQuery.of(context).size.height,
    bottom: btm * MediaQuery.of(context).size.height,
    right: rt * MediaQuery.of(context).size.width,
    left: lft * MediaQuery.of(context).size.width,
    child: SquareBTN(
        status,
        buttonfunc,
        context,
        btnh * MediaQuery.of(context).size.height,
        btnw * MediaQuery.of(context).size.width,
        txt),
  );
}

Widget SquareBTN(int status, Widget buttonfunc, BuildContext context,
    double height, double width, String text) {
  funa(Widget buttonfunc) async {
    print("a $buttonfunc");
    Get.to(() => buttonfunc,
        transition: Transition.circularReveal, duration: Duration(seconds: 1));
  }

  funb(Widget buttonfunc) async {
    print('b $buttonfunc');
    final snackBar = SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              height: 0.2 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 0.2 * MediaQuery.of(context).size.width,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Oh snap!",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          "🚧 This Page is Under Construction 🚧",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset(
                "assets/icons/bubbles.svg",
                height: 0.15 * MediaQuery.of(context).size.height,
                width: 0.08 * MediaQuery.of(context).size.height,
                color: Color(0xFF801336),
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/fail.svg",
                  height: 0.12 * MediaQuery.of(context).size.height,
                  color: Color(0xFF801336),
                ),
                SvgPicture.asset(
                  "assets/icons/close.svg",
                  height: 0.04 * MediaQuery.of(context).size.height),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context)..showSnackBar(snackBar);

    await Future.delayed(Duration(microseconds: 100));

    Get.to(() => buttonfunc,
        transition: Transition.circularReveal, duration: Duration(seconds: 1));
  }

  return Container(
    width: width,
    height: height,
    child: GestureDetector(
      onTap: () async {
        status == 1 || status == 1 ? funa(buttonfunc) : funb(buttonfunc);
      },
      child: Image.asset(
        text,
        height: .35 * MediaQuery.of(context).size.height,
      ),
    ),
  );
}
