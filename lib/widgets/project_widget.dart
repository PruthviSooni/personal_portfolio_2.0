import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/projects.dart';
import 'package:portfolio/utils/colors.dart';

class ProjectWidget extends StatelessWidget {
  final Projects projects;

  const ProjectWidget({Key key, this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      color: kLightGrey,
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height / 5,
            child: Column(
              children: [
                Text(
                  projects.title,
                  style: GoogleFonts.raleway(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    Chip(
                      label: Text(
                        'Flutter',
                        style:
                            GoogleFonts.raleway(fontSize: 14, color: kDarkGrey),
                      ),
                      backgroundColor: kAccentColor,
                      shadowColor: kAccentColor,
                    ),
                    Chip(
                      label: Text(
                        'Flutter',
                        style:
                            GoogleFonts.raleway(fontSize: 14, color: kDarkGrey),
                      ),
                      backgroundColor: kAccentColor,
                      elevation: 0,
                      shadowColor: kAccentColor,
                    ),
                    Chip(
                      label: Text(
                        'Flutter',
                        style:
                            GoogleFonts.raleway(fontSize: 14, color: kDarkGrey),
                      ),
                      backgroundColor: kAccentColor,
                    ),
                    Chip(
                      label: Text(
                        'Flutter',
                        style:
                            GoogleFonts.raleway(fontSize: 14, color: kDarkGrey),
                      ),
                      backgroundColor: kAccentColor,
                    ),
                    Chip(
                      label: Text(
                        'Flutter',
                        style:
                            GoogleFonts.raleway(fontSize: 14, color: kDarkGrey),
                      ),
                      backgroundColor: kAccentColor,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
