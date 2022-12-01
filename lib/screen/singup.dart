import 'package:audioplayers/audioplayers.dart';
import 'package:cocola_jems/screen/singin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../reuse/reuse.dart';
import '../utils/color_utils.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0.25 * MediaQuery.of(context).size.height, 20, 0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: .025 *MediaQuery.of(context).size.height,
                    ),
                    reusableTextField("Enter UserName", Icons.person_outline, false,
                        _userNameTextController),
                    SizedBox(
                      height: .025 *MediaQuery.of(context).size.height,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    SizedBox(
                      height: .025 *MediaQuery.of(context).size.height,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    SizedBox(
                      height: .025 *MediaQuery.of(context).size.height,
                    ),
                    firebaseUIButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                        final player1= AudioPlayer();
                        player1.play(AssetSource('audio/c_ans.mp3'));
                        print("Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SingIn()));
                      }).onError((error, stackTrace) {
                        final player= AudioPlayer();
                        player.play(AssetSource('audio/w_ans.mp3'));
                        print("Error ${error.toString()}");
                      });
                    })
                  ],
                ),
              ),
          ),
      ),
    );
  }
}