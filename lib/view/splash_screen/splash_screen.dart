import 'dart:async';

import 'package:flutter/material.dart';
import 'package:library_management/utils/colorConstants.dart';
import 'package:library_management/utils/imageConstants.dart';
import 'package:library_management/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstants.SPLASH_SCREEN,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Imageconstants.SPLASH_IMAGE),
              height: 150,
              width: 200,
            ),
            Text(
              'LibraryLink',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
