import 'package:flutter/material.dart';
import 'package:quiz_app/splashscreen.dart';

void main(){

  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        )
      ),
      home: splashscreen(),
      
    );
  }
}