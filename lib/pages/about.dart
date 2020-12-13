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
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return pageView(constraints);
    });
  }

  Widget pageView(BoxConstraints constraints) => Container(
        color: kDarkGrey,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: constraints.maxWidth < 800 ? 50 : 150,
              left: constraints.maxWidth < 800 ? 50 : 100,
              right: constraints.maxWidth < 800 ? 50 : 100,
              child: RichText(
                text: TextSpan(
                  text: 'Hi👋',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: constraints.maxWidth < 800 ? 35 : 50,
                  ),
                ),
              ),
            ),
            Positioned(
              top: constraints.maxWidth < 800 ? 100 : 220,
              left: constraints.maxWidth < 800 ? 50 : 100,
              child: Row(
                children: [
                  Text('I am ',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: constraints.maxWidth < 800 ? 35 : 50,
                        letterSpacing: 1.5,
                      )),
                  TypewriterAnimatedTextKit(
                    text: ['Pruthvi_Soni'],
                    alignment: Alignment(1.0, -1.0),
                    totalRepeatCount: 1,
                    speed: Duration(milliseconds: 300),
                    textStyle: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: constraints.maxWidth < 800 ? 35 : 50,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: constraints.maxWidth < 800 ? 130 : 260,
              left: constraints.maxWidth < 800 ? 50 : 100,
              right: constraints.maxWidth < 800 ? 50 : 100,
              child: Column(
                children: [
                  Text(
                    aboutMySelf,
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Positioned(
              top: constraints.maxWidth < 800 ? 250 : 350,
              left: constraints.maxWidth < 800 ? 50 : 100,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                height: 60,
                child: RotateAnimatedTextKit(
                  totalRepeatCount: 1000,
                  text: [
                    "My Hobby and Interest's are",
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
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: constraints.maxWidth < 800 ? 330 : 430,
              left: constraints.maxWidth < 800 ? 50 : 100,
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
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                Assets.personIllustration,
                width: constraints.maxWidth < 800 ? 350 : 400,
              ),
            ),
          ],
        ),
      );
}
