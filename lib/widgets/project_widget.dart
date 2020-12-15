import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/projects.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/urls.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ProjectWidget extends StatelessWidget {
  final Projects projects;

  const ProjectWidget({Key key, this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        child: Column(
          children: [
            Expanded(
              flex: 60,
              child: Container(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 30, right: 20),
                      alignment: Alignment.topRight,
                      child: Icon(
                        FontAwesome.external_link,
                        color: kAccentColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(projects.icon),
                      backgroundColor: kDarkGrey,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 40,
              child: Container(
                width: size.width,
                child: Column(
                  children: [
                    Text(
                      projects.title,
                      style: GoogleFonts.raleway(
                          fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      alignment: WrapAlignment.center,
                      children: projects.technologies
                          .map(
                            (technologies) => Container(
                              alignment: Alignment.center,
                              constraints:
                                  BoxConstraints(maxWidth: 115, minWidth: 60),
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: kAccentColor,
                              ),
                              child: FittedBox(
                                child: Text(
                                  technologies,
                                  style:
                                      GoogleFonts.raleway(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
