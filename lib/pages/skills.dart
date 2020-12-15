import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import '../utils/assets.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
    );
    return ResponsiveWidgets.builder(
      // referenceHeight: 1000,
      // referenceWidth: 600,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return pageView(constraints, context);
      }),
    );
  }

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    var size = constraints.maxWidth / 5.floorToDouble();
    var maxWidth = constraints.maxWidth;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
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
                              // direction: Axis.horizontal,
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
                        children: Assets.skills(size <= 200 ? 220 : size, constraints),
                      ),
              ),
            ],
          ),
          // Icons
          Container(
            margin: EdgeInsets.only(left: 20, top: 5),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(50),
            child: Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              spacing: 10,
              children: Assets.iconsList(maxWidth < 800 ? 40 : 50),
            ),
          ),
        ],
      ),
    );
  }
}
