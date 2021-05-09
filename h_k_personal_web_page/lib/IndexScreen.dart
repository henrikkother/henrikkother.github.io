import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_k_personal_web_page/DetailPage.dart';

import 'Data/ProjectDataStructure.dart';

class IndexScreen extends StatefulWidget {
  List<ProjectDataStructure> projectList;

  IndexScreen(this.projectList);

  _IndexScreen createState() => _IndexScreen(projectList);
}

class _IndexScreen extends State<IndexScreen> {
  _IndexScreen(this.projectList);
  List<ProjectDataStructure> projectList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: projectList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 30, right: 30),
                              child: AutoSizeText(
                                projectList[index].mainTitle,
                                style: GoogleFonts.notoSans(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    color: Colors.black,
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.none)),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 30,
                              ),
                              child: AutoSizeText(
                                projectList[index].funDescription,
                                style: GoogleFonts.notoSans(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                    color: Colors.black,
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.none)),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 30,
                              ),
                              child: TextButton(
                                  child: Text(
                                    "Details...",
                                    style: GoogleFonts.notoSans(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DetailPage(projectList[index])),
                                    );
                                  })),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            }));
  }
}
