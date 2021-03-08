import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/provider/app.provider.dart';
import 'package:portfolio/widgets/project_widget.dart';
import 'package:provider/provider.dart';
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
      child: Builder(builder: (context) {
        if (!!Provider.of<AppProvider>(context, listen: false).projectLoad) {
          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text(
                  'Projects Overview',
                  style: GoogleFonts.raleway(fontSize: 26, color: Colors.white),
                ),
              ),
              Flexible(
                child: Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: Provider.of<AppProvider>(context, listen: false)
                        .projects
                        .length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item =
                          Provider.of<AppProvider>(context, listen: false)
                              .projects[index];
                      return ProjectWidget(
                        constraints: constraints,
                        projects: project.Projects(
                            title: item.title,
                            description: item.description,
                            icon: item.icon,
                            sId: item.sId,
                            url: item.url,
                            technologies: item.technologies),
                      );
                    },
                  ),
                ),
              ),
            ],
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
