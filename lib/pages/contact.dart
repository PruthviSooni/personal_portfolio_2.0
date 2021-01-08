import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/urls.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return pageView(constraints, context);
      });

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              'Contact Me',
              style: GoogleFonts.raleway(fontSize: 26, color: Colors.white),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 50, top: 20),
                  child: Image.asset(
                    Assets.conversationIllustration,
                    width: constraints.maxWidth < 500
                        ? MediaQuery.of(context).size.width / 1.5
                        : MediaQuery.of(context).size.width / 5,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  width: constraints.biggest.width / 1.5,
                  child: Text(
                    "Would you like to work with me? Awesome!",
                    style: GoogleFonts.raleway(
                        color: kAccentColor,
                        fontSize: constraints.maxWidth < 500 ? 18 : 28),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: kAccentColor,
                  onPressed: () {
                    Urls.launchMail;
                  },
                  child: Text('Get In Touch.',
                      style: GoogleFonts.raleway(
                        fontSize: 28,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
