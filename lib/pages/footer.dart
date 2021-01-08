import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/colors.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          // margin: EdgeInsets.only(bottom: constraints.maxWidth < 500 ? 70 : 10),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Center(
                child: Text(
                  '© 2021 developed by Pruthvi Soni',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    color: kAccentColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Developed using Flutter 🎯',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    color: kAccentColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
