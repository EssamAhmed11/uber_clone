import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'foodhome';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void goToMain() async {
    //I just copy this code from salalah as it is (I am not familiar with)

    Timer(
      Duration(seconds: 1),
      () {
        Navigator.pushReplacementNamed(context, Home.id);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    goToMain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset('assets/images/bz.png'),
        ),
      ),
    );
  }
}
