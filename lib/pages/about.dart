import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/urls.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return pageView(constraints, context);
      });

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    var size = MediaQuery.of(context).size;
    var maxWidth = constraints.maxWidth;
    return Container(
      color: kDarkGrey,
      // width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.topCenter,
      child: maxWidth > 500
          ? Stack(
              children: [
                Positioned(
                  top: maxWidth > 500 ? 400 : null,
                  right: maxWidth > 500 ? 5 : null,
                  bottom: maxWidth < 500 ? 10 : null,
                  left: maxWidth < 500
                      ? 20
                      : maxWidth <= 400
                          ? 50
                          : null,
                  child: illustration(maxWidth, constraints),
                ),
                Positioned(top: 20, left: 40, child: aboutMe(maxWidth, size)),
              ],
            )
          : Column(
              children: [
                aboutMe(maxWidth, size),
                illustration(maxWidth, constraints),
              ],
            ),
    );
  }

  Widget illustration(double maxWidth, BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Image.asset(
        Assets.developerIllustration,
        width: maxWidth <= 400
            ? 250
            : maxWidth < 500
                ? 350
                : constraints.biggest.width / 2.7,
      ),
    );
  }

  Stack aboutMe(double maxWidth, Size size) {
    return Stack(
      children: [
        Container(
          width: maxWidth < 500 ? size.width / 1.2 : size.width / 1.7,
          height: maxWidth < 500 ? size.height / 1.4 : size.height / 1.7,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: kDarkGrey,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: kAccentColor, width: .5),
            boxShadow: [
              BoxShadow(
                color: kAccentColor,
                blurRadius: 1,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: maxWidth < 500 ? 8 : 10,
                        backgroundColor: Colors.red,
                      ),
                      SizedBox(width: 5),
                      CircleAvatar(
                        radius: maxWidth < 500 ? 8 : 10,
                        backgroundColor: Colors.yellow.shade800,
                      ),
                      SizedBox(width: 5),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: maxWidth < 500 ? 8 : 10,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: maxWidth < 600 ? 50 : 100,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Hi👋',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: maxWidth < 800 ? 35 : 50,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            'I am ',
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: maxWidth < 800 ? 28 : 45,
                                letterSpacing: 1.5,
                                height: 1),
                          ),
                          TypewriterAnimatedTextKit(
                            text: ['Pruthvi_Soni'],
                            totalRepeatCount: 1,
                            speed: Duration(milliseconds: 300),
                            textStyle: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: maxWidth < 800 ? 28 : 45,
                                letterSpacing: 1.5,
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        aboutMySelf,
                        style: GoogleFonts.raleway(
                          fontSize: maxWidth < 800 ? 18 : 28,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      padding: EdgeInsets.only(top: 5),
                      height: 70,
                      child: RotateAnimatedTextKit(
                        totalRepeatCount: 1000,
                        text: [
                          "My Hobby and Interest's are ",
                          "Android 🧡",
                          "Flutter 📱",
                          "Dart 🎯",
                          "Web Development 💻",
                          "Netflix 🎬",
                          "Music 🎵",
                          "Tech Enthusiast 👨‍💻",
                          "Gamer 🎮",
                        ],
                        isRepeatingAnimation: true,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: maxWidth < 800 ? 20 : 35,
                        ),
                      ),
                    ),
                    maxWidth > 800
                        ? Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.bottomLeft,
                            child: FlatButton.icon(
                              padding: EdgeInsets.all(16),
                              color: kAccentColor,
                              label: Text(
                                'My Resume',
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  color: Colors.black,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              onPressed: () => Urls.showResume,
                              icon: Icon(
                                AntDesign.form,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
