import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List<project.Projects> projects;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    projects = await GetData().getProjects();
    print(projects[0].title);
    return projects;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print(constraints.maxWidth);
      return pageView(constraints, context);
    });
  }

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    var size = constraints.maxWidth / 5.floorToDouble();
    var maxWidth = constraints.maxWidth;
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      color: kDarkGrey,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.hasData
                  ? Stack(
                      children: [
                        Container(
                          height: 400,
                          margin: EdgeInsets.all(20),
                          child: GridView.builder(
                            itemCount: projects.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return ProjectWidget(
                                projects: project.Projects(
                                  title: projects[index].title,
                                  description: projects[index].description,
                                  icon: projects[index].icon,
                                  id: projects[index].id,
                                  url: projects[index].url,
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1),
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: Text(snapshot.error.toString()),
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
