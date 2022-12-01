import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../start.dart';

class Doc1 extends StatefulWidget {
  const Doc1({Key? key}) : super(key: key);

  @override
  State<Doc1> createState() => _Doc1State();
}

class _Doc1State extends State<Doc1> {
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
        child: const Doc1D()
    );
  }
}


class Doc1D extends StatefulWidget {
  const Doc1D({Key? key}) : super(key: key);

  @override
  State<Doc1D> createState() => _Doc1DState();
}

class _Doc1DState extends State<Doc1D> {

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
            backgroundColor: Colors.orangeAccent,
            elevation: 20,
            title: Center(child: Text("About JWST"),),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orangeAccent,
            child: Icon(Icons.home),
            onPressed: () async{
              controller.loadUrl('https://webb.nasa.gov/');
            },
          ),
          body: Stack(
            children: [
              WebView(
                initialUrl: 'https://webb.nasa.gov/',
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
