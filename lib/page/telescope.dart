import 'package:cocola_jems/page/home.dart';
import 'package:cocola_jems/page/jwst.dart';
import 'package:cocola_jems/page/start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Telescope extends StatefulWidget {
  const Telescope({Key? key}) : super(key: key);

  @override
  State<Telescope> createState() => _TelescopeState();
}

class _TelescopeState extends State<Telescope> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/bg/telbg.png"
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: TelescopeD(),
    );
  }
}

class TelescopeD extends StatefulWidget {
  const TelescopeD({Key? key}) : super(key: key);

  @override
  State<TelescopeD> createState() => _TelescopeDState();
}

class _TelescopeDState extends State<TelescopeD> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          SizedBox(
            height: 20,
          ),
          Positioned(
            top: .15*MediaQuery.of(context).size.height,
            left: .08*MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.all(25),
              height: .6*MediaQuery.of(context).size.height,
              width: .3*MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: const BorderRadius.only(topRight: Radius.elliptical(80, 30)),
                  border: Border.all(color: Colors.white),
              ),
              child:Column(
                children: const [
                  Text(
                    textAlign: TextAlign.center,
                    "Introduction to Telescope",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 20,

                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Parts of James Webb Space Telescope in 3D.",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: .13*MediaQuery.of(context).size.height,
            bottom: .13*MediaQuery.of(context).size.height,
            right: .05*MediaQuery.of(context).size.width,
            left: .4*MediaQuery.of(context).size.width,
            child:GestureDetector(
              onTap: () {
                Get.to(() => JWST(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                  ),
                  child: ModelViewer(
                  src: 'assets/3d/jwst.glb',
                  alt: "A 3D model of an astronaut",
                  poster:'assets/icon/jwst.webp',
                  posterColor: Colors.transparent,

                  autoRotate: true,
                  cameraControls: true,
                  backgroundColor: Colors.transparent,

                  arModes: ['scene-viewer', 'webxr', 'quick-look'],
                  ar: true,
                  arScale:ArScale.auto,
                  enablePan: true,
                  loading: Loading.eager,

                ),
              ),
            ),
          ),
          Positioned(
            bottom: -.07*MediaQuery.of(context).size.height,
            right: .4*MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
                Get.to(() => Start(), transition:Transition.circularReveal,duration: Duration(seconds: 1));
              },
              child: Image.asset(
                  "assets/icon/start.png",
                      height: .4*MediaQuery.of(context).size.height,
              ),
            ),
          ),
          Positioned(
            bottom: .03*MediaQuery.of(context).size.height,
            left: .3*MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Home() ));
              },
              child: Image.asset(
                "assets/icon/menu.png",
                  height: .2*MediaQuery.of(context).size.height,
              ),
            ),
          ),
        ],
    );
  }
}

