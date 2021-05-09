import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h_k_personal_web_page/Data/ProjectDataStructure.dart';

class DetailPage extends StatefulWidget {
  ProjectDataStructure thisProjectDataStructure;
  _DetailPage createState() => _DetailPage(thisProjectDataStructure);

  DetailPage(ProjectDataStructure projectDataStructure) {
    this.thisProjectDataStructure = projectDataStructure;
  }
}

class _DetailPage extends State<DetailPage> {
  ProjectDataStructure thisProjectDataStructure;

  _DetailPage(this.thisProjectDataStructure);

  Color background = new Color.fromARGB(255, 48, 197, 182);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ),
              Container(width: MediaQuery.of(context).size.width * 0.4),
              Text(thisProjectDataStructure.mainTitle,
                  style: GoogleFonts.notoSans(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.black,
                      decoration: TextDecoration.none))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(thisProjectDataStructure.longDescription,
                style: GoogleFonts.notoSans(
                    fontSize: 25,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
          ),
          Row(
            children: [
              Expanded(child: Center(child: Image.network("/assets/"+thisProjectDataStructure.detailImageLink,width: MediaQuery.of(context).size.width*0.75,)))
            ],
          )
        ]),
        color: background,
      ),
    );
  }
}
