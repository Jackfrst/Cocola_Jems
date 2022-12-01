import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

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
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(.1*MediaQuery.of(context).size.height),
        //   child: AppBar(
        //     backgroundColor: Colors.transparent,
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        body: LeaderBoardD(),
      ),
    );
  }
}

class LeaderBoardD extends StatefulWidget {
  const LeaderBoardD({Key? key}) : super(key: key);

  @override
  State<LeaderBoardD> createState() => _LeaderBoardDState();
}

class _LeaderBoardDState extends State<LeaderBoardD> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0.08*MediaQuery.of(context).size.height),
              height: MediaQuery.of(context).size.height,
              width: 0.45*MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xff222433),
                borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft:Radius.circular(10.0)),
                // border: Border.all(
                //     color: Colors.white
                // ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 0.1*MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Color(0xff2C3144),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(color: Colors.white30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Region", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 15.0)),
                              Text("Natonal", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15.0)),
                              Text("Global", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15.0)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 0.07*MediaQuery.of(context).size.height),
                      Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.yellowAccent,
                                  Colors.deepOrangeAccent,
                                  Colors.redAccent,
                                ]
                            ),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft:Radius.circular(10.0)),
                            // border: Border.all(
                            //     color: Colors.white
                            // ),
                          ),
                          
                            child: Padding(
                              padding: const EdgeInsets.only(top:1.0,left: 2.0,right: 2.0),
                              child: Container(
                                height: .7*MediaQuery.of(context).size.height,
                                width: .669*MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Color(0xff2C3144),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft:Radius.circular(10.0)),
                                  // border: Border.all(
                                  //     color: Colors.white
                                  // ),
                                ),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    rank(),
                                    rank(),
                                    rank(),
                                    rank(),
                                    rank(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            Container(
              margin: EdgeInsets.only(top: 0.08*MediaQuery.of(context).size.height),
              height: MediaQuery.of(context).size.height,
              width: 0.45*MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xff222433),
                borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft:Radius.circular(10.0)),
              ),
              child:const WinnerContainer()
        ),
      ]
    );
  }
}

class WinnerContainer extends StatelessWidget {
  const WinnerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Positioned(
            top: 0.12*MediaQuery.of(context).size.height,
            left: 0.175*MediaQuery.of(context).size.width,
            child: Image.asset("assets/select/crown.png",
                height: 0.1*MediaQuery.of(context).size.height ,
                width: 0.1*MediaQuery.of(context).size.width
            ),
          ),
          Positioned(
            top: 0.3*MediaQuery.of(context).size.height,
            left: 0.167*MediaQuery.of(context).size.width,
            child: Container(
              height: 0.4*MediaQuery.of(context).size.height ,
              width: 0.225*MediaQuery.of(context).size.height ,
              decoration: BoxDecoration(
                  color: Color(0xff2C3144),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                  border: Border.all(color: Colors.redAccent),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),

                  Text('GG',style:TextStyle(
                    color: Colors.white,
                  ),
                  ),

                  Text('99',style:TextStyle(
                    color: Colors.white,
                  ),
                  ),

                ],
              ),
            )
          ),
          Positioned(
              top: 0.2*MediaQuery.of(context).size.height,
              left: 0.1868*MediaQuery.of(context).size.width,
              child: Container(
                 height: 0.15*MediaQuery.of(context).size.height ,
                 width: 0.15*MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.yellow),
                  image: const DecorationImage(
                      image:AssetImage('assets/bg/rrr.png'),
                      fit: BoxFit.fill,
                  )
                ),
              ),
            ),
          Positioned(
              top: 0.5*MediaQuery.of(context).size.height,
              left: 0.032*MediaQuery.of(context).size.width,
              child: Container(
                height: 0.2*MediaQuery.of(context).size.height ,
                width: 0.225*MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                  color: Color(0xff2C3144),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                  border: Border.all(color: Colors.redAccent),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    Text('GG',style:TextStyle(
                      color: Colors.white,
                    ),
                    ),

                    Text('99',style:TextStyle(
                      color: Colors.white,
                    ),
                    ),

                  ],
                ),
              ),
          ),
          Positioned(
              top: 0.4*MediaQuery.of(context).size.height,
              left: 0.05*MediaQuery.of(context).size.width,
              child: Container(
                  height: 0.15*MediaQuery.of(context).size.height ,
                  width: 0.15*MediaQuery.of(context).size.height ,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.brown),
                    image: const DecorationImage(
                      image: AssetImage('assets/bg/rrr.png'),
                      fit: BoxFit.fill,
                    )
                  ),
              ),
            ),
          Positioned(
              top: 0.5*MediaQuery.of(context).size.height,
              right: 0.032*MediaQuery.of(context).size.width,
              child: Container(
                height: 0.2*MediaQuery.of(context).size.height ,
                width: 0.225*MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                  color: Color(0xff2C3144),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                  border: Border.all(color: Colors.redAccent),
                ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      Text('GG',style:TextStyle(
                        color: Colors.white,
                        ),
                      ),

                      Text('99',style:TextStyle(
                        color: Colors.white,
                        ),
                     ),

                    ],
                  ),
                ),
              ),
          Positioned(
              top: 0.4*MediaQuery.of(context).size.height,
              right: 0.052*MediaQuery.of(context).size.width,
              child: Container(
                height: 0.15*MediaQuery.of(context).size.height ,
                width: 0.15*MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white70),
                    image: const DecorationImage(
                      image: AssetImage('assets/bg/rrr.png'),
                      fit: BoxFit.fill,
                    )
                ),
              ),
            ),
      ],
    );
  }
}

class rank extends StatelessWidget {
  const rank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                                     Container(
      margin: EdgeInsets.all(6.0),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Container(
          height: .2*MediaQuery.of(context).size.height,
          width: .4*MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xff222433),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
                color: Colors.white
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 0.15*MediaQuery.of(context).size.height ,
                width: 0.15*MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white70),
                ),
                child:Center(
                    child: Text(
                        "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              Container(
                height: 0.15*MediaQuery.of(context).size.height ,
                width: 0.15*MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white70),
                ),
                child:Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
              Container(
                height: 0.15*MediaQuery.of(context).size.height ,
                width: 0.15*MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white70),
                ),
                child:Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










