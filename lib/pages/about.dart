import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return webView;
      } else {
        return mobileView;
      }
    });
  }

  Widget get mobileView => Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 10,
              left: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Hi, 👋',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                        children: [
                          TextSpan(text: '\nI am Pruthvi Soni'),
                        ]),
                  ),
                  Text(
                    '\nCurrently i am pursuing Bachelor Of Engineering from G.C.E.T Institute of Technology',
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/person.png',
                width: 400,
              ),
            )
          ],
        ),
      );

  Widget get webView => Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 150,
              left: 100,
              child: RichText(
                text: TextSpan(
                    text: 'Hi, 👋',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                    children: [
                      TextSpan(text: '\nI am Pruthvi Soni'),
                      TextSpan(
                        text:
                            '\nCurrently i am pursuing Bachelor Of Engineering from \nG.C.E.T Institute of Technology',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/person.png',
                width: 400,
              ),
            )
          ],
        ),
      );
}
// 'Hi, 👋',
