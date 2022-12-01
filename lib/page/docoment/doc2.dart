import 'dart:io';
import 'dart:ui' as ui;

import 'package:cocola_jems/page/docoment/doc_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../start.dart';

class Doc2 extends StatefulWidget {
  const Doc2({Key? key}) : super(key: key);

  @override
  State<Doc2> createState() => _Doc2State();
}

class _Doc2State extends State<Doc2> {
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
        child: const Doc2D()
    );
  }
}


class Doc2D extends StatefulWidget {
  const Doc2D({Key? key}) : super(key: key);

  @override
  State<Doc2D> createState() => _Doc2DState();
}

class _Doc2DState extends State<Doc2D> {

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
            backgroundColor: Colors.purpleAccent,
            title: Center(child: Text("Images"),),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            child: Icon(Icons.home),
            onPressed: () async{
              controller.loadUrl('https://webbtelescope.org/resource-gallery/images');
            },
          ),
          body: Stack(
            children: [
              WebView(
                initialUrl: 'https://webbtelescope.org/resource-gallery/images',
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
