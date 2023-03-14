import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled4/Screen/Widget.dart';

import 'Screen/ERPURL.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ErpUrl(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[



              Center(
                  child: WidgetRingAnimator(
                size: 160,
                ringIcons: const [
                  'assets/store.png',
                  'assets/product.png',
                  'assets/cart.png',
                  'assets/rupee.png',
                  'assets/delivery.png',
                ],
                ringIconsSize: 4,
                // ringIconsColor: Colors.grey[200],
                ringAnimation: Curves.easeInOutQuart,
                ringColor: Colors.lightBlueAccent,
                reverse: false,
                ringAnimationInSeconds: 10,
                child: Container(
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/app_logo.png',
                        color: Colors.lightBlueAccent,
                        height: 75,
                      ),
                      radius: 55.0,
                    ),
                  ),
                ),
              )),
              Center(
                child: AvatarGlow(
                  glowColor: Colors.lightBlueAccent,
                  endRadius: 200.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    // Replace this child with your own

                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: Image.asset(
                        'assets/app_logo.png',
                        height: 75,
                      ),
                      radius: 55.0,
                    ),
                  ),
                ),
              ),


              ResponsiveWrapper(
                maxWidth: 1200,
                minWidth: 480,
                defaultScale: true,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                  ResponsiveBreakpoint.autoScale(2460, name: '4K'),
                ],

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 115,),
                        child: Text(
                          "Eden's ERP",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 27,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: .5)),
                        ),
                      ),
                    ),

                    SizedBox(height: 640,),

                Center(
                  child: Text(
                        "From our farm to your table, Edens brings you the best",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black38,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .5)),
                  ),
                ),


                ],),
              ),
              SizedBox(height: 150,),





            ],
          )),
    );
  }
}
