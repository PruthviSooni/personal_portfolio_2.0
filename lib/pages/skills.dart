import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/colors.dart';

import '../utils/assets.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return pageView(constraints, context);
      });

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    var size = constraints.maxWidth / 5.floorToDouble();
    var maxWidth = constraints.maxWidth;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            color: kAccentColor,
            thickness: .5,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              'Skills Overview',
              style: GoogleFonts.raleway(fontSize: 26, color: Colors.white),
            ),
          ),
          Container(
            child: maxWidth < 800
                ? Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(20),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Wrap(
                          runSpacing: 5,
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          children: Assets.skills(300, constraints),
                        ),
                      ],
                    ),
                  )
                : Wrap(
                    runSpacing: 5,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children:
                        Assets.skills(size <= 200 ? 220 : size, constraints),
                  ),
          ),
          // Icons
          Container(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.only(left: 50, top: 10, right: 50, bottom: 0),
            child: Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              spacing: 5,
              children: Assets.iconsList(maxWidth < 500 ? 40 : 50),
            ),
          ),
        ],
      ),
    );
  }
}
