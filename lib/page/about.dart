import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cocola_jems/page/home.dart';


class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/bg/Lbrd.png"
          ),
          fit: BoxFit.fill,
        ),
      ),
      child:const Scaffold(
        backgroundColor: Colors.transparent,
        body: AboutD(),
      ),
    );
  }
}

class AboutD extends StatefulWidget {
  const AboutD({Key? key}) : super(key: key);

  @override
  State<AboutD> createState() => _AboutDState();
}

class _AboutDState extends State<AboutD> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: RichText(
          text: TextSpan(
            text: " About ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 25,
            ),
            children: [
              TextSpan(
                text: " US ",
                style: TextStyle(
                  color: Color(0xFF11249F),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(children: [
          appinfo(context),
          dev(context),
        ]),
      ),
    );
  }
}

Widget appinfo(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo("assets/icons/icon.png"),
          logo("assets/icons/Logocse.png"),
          logo("assets/icons/VU-Logo.png"),
        ],
      ),
      SizedBox(height: 20,),
      appname(),
      appver(),
      //dec(context),
    ],
  );
}

Widget logo(String address) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Center(
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset(address),
      ),
    ),
  );
}

Widget appname() {
  return Container(
    child: const Center(
      child: Text(
        " Cocola Jems ",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
      ),
    ),
  );
}

Widget appver() {
  return Container(
    child: Center(
      child: Text(
        " Version : 0.1 ",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget dev(BuildContext context) {
  return Positioned(
    bottom: 30,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          " ARML Technologies || Team Kryptonite",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ),
    ),
  );
}

Widget dec(BuildContext context) {
  return Positioned(
    bottom: 30,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          " ARML Technologies || Team Kryptonite",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.black54),
          ),
        ),
      ),
  );
}