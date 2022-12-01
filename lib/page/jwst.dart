import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JWST extends StatefulWidget {
  const JWST({Key? key}) : super(key: key);

  @override
  State<JWST> createState() => _JWSTState();
}

class _JWSTState extends State<JWST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/bg/docbg.png"
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
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
    );
  }
}

