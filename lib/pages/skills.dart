import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print(constraints.maxWidth);
      return pageView(constraints, context);
    });
  }

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    var size = constraints.maxWidth / 5.floorToDouble();
    var maxWidth = constraints.maxWidth;
    return Container(
      color: kLightGrey,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: maxWidth < 800 ? 520 : 450,
            left: maxWidth < 800 ? 10 : 100,
            right: maxWidth < 800 ? 10 : 100,
            child: Column(
              children: [
                EasyWebView(
                  width: maxWidth < 800 ? 400 : 500,
                  height: 200,
                  isHtml: false,
                  isMarkdown: false,
                  src: Assets.gitStats,
                  onLoaded: () {},
                ),
              ],
            ),
          ),
          Column(
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
                padding: EdgeInsets.all(20),
                child: Wrap(
                  runSpacing: 5,
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children:
                      Assets.skills(size <= 200 ? 220 : size, constraints),
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
              children: Assets.iconsList(maxWidth < 800 ? 35 : 50),
            ),
          ),
        ],
      ),
    );
  }
}
