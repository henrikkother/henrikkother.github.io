import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_k_personal_web_page/Data/ProjectDataStructure.dart';

import '../DetailPage.dart';

class CarouselBase extends StatelessWidget {
  ProjectDataStructure currentProject;

  CarouselBase(this.currentProject);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
            )),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "/assets/" + currentProject.imageLink),
                          fit: BoxFit.cover)),
                ),
                new RotatedBox(
                    quarterTurns: 3,
                    child: new AutoSizeText(
                      currentProject.funDescription,
                      style: GoogleFonts.notoSans(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          color: Colors.black,
                          textStyle:
                              TextStyle(decoration: TextDecoration.none)),
                    ))
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Container(
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 0.0,
                              maxWidth: 500.0,
                              minHeight: 0.0,
                              maxHeight: 500.0,
                            ),
                            child: AutoSizeText(
                              currentProject.mainTitle,
                              style: GoogleFonts.notoSans(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05,
                                  color: Colors.black,
                                  textStyle: TextStyle(
                                      decoration: TextDecoration.none)),
                            )),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            TextButton(
                                style: ButtonStyle(),
                                child: AutoSizeText("Details...",
                                    style: GoogleFonts.notoSans(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        color: Colors.black,
                                        textStyle: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.black)),
                                    textAlign: TextAlign.start),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(currentProject)),
                                  );
                                })
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
