import 'dart:io';
import 'dart:ui' as ui;

import 'package:cocola_jems/page/docoment/doc_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../start.dart';

class Doc3 extends StatefulWidget {
  const Doc3({Key? key}) : super(key: key);

  @override
  State<Doc3> createState() => _Doc3State();
}

class _Doc3State extends State<Doc3> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  void dispose(){
    super.dispose();
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
                "assets/bg/docbg.png"
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: const Doc3D()
    );
  }
}


class Doc3D extends StatefulWidget {
  const Doc3D({Key? key}) : super(key: key);

  @override
  State<Doc3D> createState() => _Doc3DState();
}

class _Doc3DState extends State<Doc3D> {
  late WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 20,
            title: const Center(child: Text("Partnership"),),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.home),
            onPressed: () async{
              controller.loadUrl('https://webb.nasa.gov/content/meetTheTeam/team.html');
            },
          ),
          body: Stack(
            children: [
              WebView(
                initialUrl: 'https://webb.nasa.gov/content/meetTheTeam/team.html',
                javascriptMode: JavascriptMode.unrestricted,
                onPageStarted: (url) {
                  setState(() {
                    loadingPercentage = 0;
                  });
                },
                onProgress: (progress) {
                  setState(() {
                    loadingPercentage = progress;
                  });
                },
                onPageFinished: (url) {
                  setState(() {
                    loadingPercentage = 100;
                  });
                },
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
              ),
              if (loadingPercentage < 100)
                LinearProgressIndicator(
                  value: loadingPercentage / 100.0,
                ),
            ],
          ),
        );

  }
}
