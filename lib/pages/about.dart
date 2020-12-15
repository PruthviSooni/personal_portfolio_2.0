import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/urls.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
    );
    return ResponsiveWidgets.builder(
      // referenceHeight: 1000,
      // referenceWidth: 600,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return pageView(constraints, context);
      }),
    );
  }

  Widget pageView(BoxConstraints constraints, BuildContext context) =>
      Container(
        color: kDarkGrey,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: constraints.maxWidth < 800 ? 20 : 100,
                ),
                ContainerResponsive(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 50),
                  // padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Hi👋',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: constraints.maxWidth < 800 ? 40 : 50,
                    ),
                  ),
                ),
                ContainerResponsive(
                  widthResponsive: true,
                  margin: EdgeInsets.only(left: 50, right: 50),
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
                          fontSize: constraints.maxWidth < 800 ? 35 : 45,
                          letterSpacing: 1.5,
                        ),
                      ),
                      TypewriterAnimatedTextKit(
                        text: ['Pruthvi_Soni'],
                        totalRepeatCount: 1,
                        speed: Duration(milliseconds: 300),
                        textStyle: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: constraints.maxWidth < 800 ? 35 : 45,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                ContainerResponsive(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  padding: EdgeInsets.only(top: 10),
                  heightResponsive: true,
                  widthResponsive: true,
                  child: Text(
                    aboutMySelf,
                    style: GoogleFonts.raleway(
                      fontSize: constraints.maxWidth < 800 ? 18 : 28,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                ContainerResponsive(
                  heightResponsive: true,
                  widthResponsive: true,
                  margin: EdgeInsets.only(left: 50, right: 50),
                  padding: EdgeInsets.only(top: 10),
                  height: 70,
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
                      fontSize: constraints.maxWidth < 800 ? 20 : 35,
                    ),
                  ),
                ),
                ContainerResponsive(
                  heightResponsive: true,
                  widthResponsive: true,
                  margin: EdgeInsets.only(left: 50),
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
                ),
              ],
            ),
            ContainerResponsive(
              heightResponsive: true,
              widthResponsive: true,
              alignment: Alignment.bottomRight,
              child: Image.asset(
                Assets.personIllustration,
                width: constraints.maxWidth < 800 ? 250 : 450,
              ),
            ),
          ],
        ),
      );
}
