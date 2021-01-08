import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/projects.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/urls.dart';

class ProjectWidget extends StatelessWidget {
  final Projects projects;
  final BoxConstraints constraints;
  const ProjectWidget({Key key, this.projects, this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ScreenUtil.init(constraints,
        designSize: Size(
          constraints.biggest.width,
          constraints.biggest.height,
        ));
    return Card(
      color: kLightGrey,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.grey.shade800,
      margin: EdgeInsets.all(12),
      child: InkWell(
        onTap: () => Urls.launchUrl(projects.url),
        // hoverColor: Colors.grey.shade900,
        splashColor: kDarkGrey,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: constraints.maxWidth < 500 ? 250 : 350,
          height: constraints.maxHeight < 500 ? 250 : 400,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 120,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 20),
                      alignment: Alignment.topRight,
                      child: Icon(
                        FontAwesome.external_link,
                        color: kAccentColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(projects.icon),
                        backgroundColor: kDarkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                child: Column(
                  children: [
                    Text(
                      projects.title,
                      style: GoogleFonts.raleway(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: projects.technologies
                          .map(
                            (technologies) => Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: kAccentColor,
                              ),
                              child: Text(
                                technologies,
                                style: GoogleFonts.raleway(color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
