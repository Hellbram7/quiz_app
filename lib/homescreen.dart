import 'package:flutter/material.dart';
import 'package:quiz_app/quizpage.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

   List<String> images = [
    "assets/images/py.png",
    "assets/images/java.png",
    "assets/images/js.png",
    "assets/images/cpp.png",
    "assets/images/linux.png",
  ];

  List<String> names = [
   "Python",
   "Java",
   "Java Script",
   "C++",
   "Linux",
  ];

  List<String> des = [
    "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learnt it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
    "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
  ];


  Widget customcard(String names, String images, String des) {
     return Padding(padding: EdgeInsets.symmetric(vertical: 30, horizontal: 35),
     child: InkWell(
       onTap: () {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loadjson(),));
       },
       child: Material(
       clipBehavior: Clip.antiAlias,
       elevation: 10,
       borderRadius: BorderRadius.circular(20.0),
       child: Container(
         color: Colors.cyan,
         child: Column(
           children: <Widget>[
           Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
           child:  Material(
             clipBehavior: Clip.antiAlias,
             borderRadius: BorderRadius.circular(40),
             elevation: 10,
             child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
               child: ClipOval(
               child: Image(
                 image: AssetImage(images),
                 fit: BoxFit.cover,
               ),
             ),
            ),
           ),
           ),
          Center(
            child: Text(
              names,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
         child: Text(
           des,
           style: TextStyle(
             color: Colors.white,
             fontSize: 18,
           ),
           maxLines: 4,
           overflow: TextOverflow.ellipsis,
         ),
        ),
           ],
         ),

       ),
     ),
     ),
     );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Quiz Star",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
            customcard(names[0], images[0], des[0]),
            customcard(names[1], images[1], des[1]),
            customcard(names[2], images[2], des[2]),
            customcard(names[3], images[3], des[3]),
            customcard(names[4], images[4], des[4]),
        ],
      ),
      
    );
  }
}