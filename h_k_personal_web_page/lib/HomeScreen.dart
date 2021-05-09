import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_k_personal_web_page/Carousel/CarouselBase.dart';
import 'package:h_k_personal_web_page/Data/ProjectDataStructure.dart';

class HomeScreen extends StatefulWidget{
  List<ProjectDataStructure> projectList;

  _HomeScreenState createState() => _HomeScreenState(projectList);

  HomeScreen(this.projectList);
}

class _HomeScreenState extends State<HomeScreen>{
  List<ProjectDataStructure> projectList ;
  int currentPage = 0;

  _HomeScreenState(this.projectList);

  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemBuilder: (context, index) {

          return Opacity(
            opacity: currentPage == index ? 1 : 0.5,
            child: CarouselBase(
                projectList[index]
            ),
          );
        },
        itemCount: projectList.length,
        controller:
          PageController(initialPage: 0, viewportFraction: 0.65),
        onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
      ),

    );
  }

}