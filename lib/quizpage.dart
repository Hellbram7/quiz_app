import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

class loadjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
        builder: (context, snapshot){
           List mydata = json.decode(snapshot.data.toString());
           if(mydata == null) {
             return Text(
               "Loading..",
             );
           }
           else {
             return quizpage(data : mydata);
           }
        },
         ),
      
    );
  }
}

class quizpage extends StatefulWidget {
  final data;
  quizpage({this.data});
  @override
  _quizpageState createState() => _quizpageState(data);
}

class _quizpageState extends State<quizpage> {
  List data;
  _quizpageState(this.data);
  
  Color colortoshow = Colors.cyan;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int i = 1;
  int marks = 0;
  int timer = 30;
  bool canceltimer = false;
  String showtimer = "30";

   Map<String, Color> btncolor = {
    "a": Colors.cyan,
    "b": Colors.cyan,
    "c": Colors.cyan,
    "d": Colors.cyan,
  };

   void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {

        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.cyan;
      btncolor["b"] = Colors.cyan;
      btncolor["c"] = Colors.cyan;
      btncolor["d"] = Colors.cyan;
    });
    starttimer();
  }

  @override
  void initState() {
    starttimer();
    super.initState();
  }

   void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void checkanswer(String k) {
    if(data[2][i.toString()] == data[1][i.toString()][k]){
    //  answer is correct
    marks = marks + 5;
    colortoshow = right;
    }
    else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      Timer(Duration(seconds: 1), nextquestion);
      canceltimer = true;
      
    });

  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        // onPressed: () {},
        onPressed: () => checkanswer(k),
        child: Text(
          data[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        // color: btncolor[k],
        color: btncolor[k],
        splashColor: Colors.cyan[700],
        highlightColor: Colors.cyan[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Quizstar",
                  ),
                  content: Text("You Can't Go Back At This Stage."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  data[0][i.toString()],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Quando",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
      ),
    ),
      
    );
  }
}