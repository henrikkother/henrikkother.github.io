import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_k_personal_web_page/HomeScreen.dart';
import 'package:h_k_personal_web_page/IndexScreen.dart';

import 'Data/ProjectDataStructure.dart';
import 'DetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Color bgColor;
  Color contactColor = Color.fromARGB(255, 238, 108, 77);
  Color activeTextColor;
  Color passiveTextColor;
  Widget homeScreen;
  Widget indexScreen;
  Widget detailScreen;
  int currentScreen;
  TextDecoration galleryDecorationStyle = TextDecoration.lineThrough;
  TextDecoration indexDecorationStyle = TextDecoration.none;

  List<ProjectDataStructure> projectList = [
    new ProjectDataStructure("cookingBuddy.PNG",
        "Cooking Buddy",
        "Cooking Buddy is a mobile cross-platform application for finding great cooking recipes. The main goal is to reduce the waste of food in every kitchen. Therefore, the app offers the ability to find specific recipes to use up leftover ingredients. "
            "\n \nOn top, Cooking Buddy features a modern design and a responsive UI. To achieve this, the App is build on Dart and Googles Flutter UI-toolkit - which makes it possible to simultaneously develop for IOS and Android. The backend uses an custom SQLite database. ",
        "Reduce your wasted food.",
      "cookingBuddyDetail.PNG"
    ),
    new ProjectDataStructure("cookingBuddy.PNG",
        "GeoGuide",
        "null",
        "Support hearing-impaired people.",
    ""
    ),
    new ProjectDataStructure("DroneLog.PNG",
        "DroneLog",
        "DroneLog ",
        "Log your drone flights.",
    "DroneLogDetail.png"),
    new ProjectDataStructure("SSP.PNG",
        "RPS Agend",
        "null",
        "AI based rock-paper-scissors.",
    ""
    ),
  ];

  _MyApp() {
    currentScreen = 0;
    this.homeScreen = new HomeScreen(projectList);
    this.indexScreen = new IndexScreen(projectList);
  }
  void changeScreenToHome() {
    this.currentScreen = 0;
    this.galleryDecorationStyle = TextDecoration.lineThrough;
    this.indexDecorationStyle = TextDecoration.none;
    this.setState(() {});
  }
  void changeScreenToIndex() {
    this.currentScreen = 1;
    this.galleryDecorationStyle = TextDecoration.none;
    this.indexDecorationStyle = TextDecoration.lineThrough;
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget titleScreen = Container(
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:30.0,bottom: 10),
                    child: TextButton(onPressed: (){changeScreenToHome();}, child: Text("Gallery",style: GoogleFonts.notoSans(fontSize: 40,color: Colors.black,decoration: this.galleryDecorationStyle,decorationColor: Colors.black)),),),
                  Padding(
                      padding: EdgeInsets.only(left:30.0,bottom: 10),
                      child: TextButton(onPressed: (){changeScreenToIndex();}, child: Text("Index",style: GoogleFonts.notoSans(fontSize: 40,color: Colors.black,decoration: this.indexDecorationStyle,decorationColor: Colors.black),),)),
                ],
              ),

              Expanded(
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right:30.0,bottom: 10),
                        child: TextButton(onPressed: (){changeScreenToHome();}, child: Text("Contact",style: GoogleFonts.notoSans(fontSize: 40,color: Colors.black)),))
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              )
            ],

          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Container(
              height: 2,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
    if (currentScreen == 0) {
      return MaterialApp(
          home: Container(
        child: Column(
          children: [
            titleScreen,
            homeScreen
          ],
        ),
        color: bgColor,
      ));
    } else if (currentScreen == 1) {
      return MaterialApp(
          home: Container(
            child: Column(
              children: [titleScreen,Container(height: 10,), indexScreen],
            ),
        color: Color.fromARGB(255, 148, 235, 205),
      ));
    }
  }
}
