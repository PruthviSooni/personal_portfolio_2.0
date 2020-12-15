import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class Contact extends StatelessWidget {
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
}

Widget pageView(BoxConstraints constraints, BuildContext context) {
  var size = constraints.maxWidth / 5.floorToDouble();
  var maxWidth = constraints.maxWidth;
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20),
          child: Text(
            'Skills Overview',
            style: GoogleFonts.raleway(fontSize: 26, color: Colors.white),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: FlatButton(
            onPressed: () {},
            child: Text('Get In Touch.',
                style: GoogleFonts.raleway(
                  fontSize: 28,
                  color: Colors.white,
                )),
          ),
        )
      ],
    ),
  );
}
