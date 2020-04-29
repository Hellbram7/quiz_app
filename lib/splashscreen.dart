import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/homescreen.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), completed);
  }

  void completed() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homescreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Text(
          "Quiz\nStar",
          style: TextStyle(
            fontSize: 70,
            fontFamily: "waltographUI",
            color: Colors.white
          ),
        ),
      ),
      
    );
  }
}