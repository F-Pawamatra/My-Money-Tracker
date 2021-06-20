import 'dart:async';
import 'package:flutter/material.dart';
import '/common/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '/index.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    );

    StartSplashScreen();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  StartSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return IndexPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kpurplecolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: animation,
              child: Image.asset(
                'assets/images/bitmap.png',
                width: 200.0,
                height: 100.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                'My Money Tracker',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  )
                )
              ),
            )
          ], 
        ),
      ),
    );
  }
}
