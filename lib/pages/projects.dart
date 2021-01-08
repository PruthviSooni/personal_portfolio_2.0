import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/service/fetchProjects.dart';
import 'package:portfolio/widgets/project_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../models/projects.dart' as project;
import '../utils/colors.dart';

class Projects extends StatefulWidget {
  final AutoScrollController controller;

  const Projects({Key key, this.controller}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  List<project.Projects> projects, reversed;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    projects = await GetData().getProjects();
    reversed = projects.reversed.toList();
    return reversed;
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        ScreenUtil.init(constraints,
            designSize: Size(
              constraints.maxWidth,
              constraints.maxHeight,
            ));
        return pageView(constraints, context);
      });

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    return Container(
      color: kDarkGrey,
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.hasData
                  ? Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Projects Overview',
                            style: GoogleFonts.raleway(
                                fontSize: 26, color: Colors.white),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 400,
                            child: ListView.builder(
                              itemCount: reversed.length,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return ProjectWidget(
                                  constraints: constraints,
                                  projects: project.Projects(
                                      title: reversed[index].title,
                                      description: reversed[index].description,
                                      icon: reversed[index].icon,
                                      sId: reversed[index].sId,
                                      url: reversed[index].url,
                                      technologies:
                                          reversed[index].technologies),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
