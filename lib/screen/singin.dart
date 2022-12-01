import 'package:cocola_jems/screen/reset_pass.dart';
import 'package:cocola_jems/screen/singup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';

import '../page/home.dart';
import '../reuse/reuse.dart';
import '../utils/color_utils.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * 0.06,
                20,
                0
            ),
            child: Column(
                children: <Widget>[
                logoWidget("assets/img/team_kryptonite.png",context),
            SizedBox(
              height: .025 *MediaQuery.of(context).size.height,
            ),
            reusableTextField("Enter UserName", Icons.person_outline, false,
                _emailTextController),
            SizedBox(
              height: .025 *MediaQuery.of(context).size.height,
            ),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                _passwordTextController),
            SizedBox(
              height: .025 *MediaQuery.of(context).size.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GuestLogin(context),
                forgetPassword(context),
              ],
            ),

            firebaseUIButton(context, "Sign In", () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)
                  .then((value) {
                final player= AudioPlayer();
                player.play(AssetSource('audio/c_ans.mp3'));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home()));
              }).onError((error, stackTrace) {
                final player= AudioPlayer();
                player.play(AssetSource('audio/w_ans.mp3'));
                print("Error ${error.toString()}");
              });
            }),
            signUpOption()
            ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: 0.4*MediaQuery.of(context).size.width,
      height: .08 * MediaQuery.of(context).size.height,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}

Widget GuestLogin(BuildContext context) {
  return Container(
    width: 0.4*MediaQuery.of(context).size.width,
    height: .08 * MediaQuery.of(context).size.height,
    alignment: Alignment.bottomLeft,
    child: TextButton(
      child: const Text(
        "Guest Login?",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.right,
      ),
      onPressed: (){
        final player= AudioPlayer();
        player.play(AssetSource('audio/c_ans.mp3'));
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
        },
    ),
  );
}




