import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/auto_scroll.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class DrawerChild extends StatelessWidget {
  final AutoScrollController controller;

  const DrawerChild({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      color: Colors.grey.shade900.withOpacity(.8),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              'About',
              style: GoogleFonts.raleway(color: Colors.white),
            ),
            onTap: () {
              AutoScroll.scrollToIndex(index: 0, controller: controller);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'Skills',
              style: GoogleFonts.raleway(color: Colors.white),
            ),
            onTap: () {
              AutoScroll.scrollToIndex(index: 1, controller: controller);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'Projects',
              style: GoogleFonts.raleway(color: Colors.white),
            ),
            onTap: () {
              AutoScroll.scrollToIndex(index: 2, controller: controller);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'Certificates',
              style: GoogleFonts.raleway(color: Colors.white),
            ),
            onTap: () {
              AutoScroll.scrollToIndex(index: 3, controller: controller);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'Contact',
              style: GoogleFonts.raleway(color: Colors.white),
            ),
            onTap: () {
              AutoScroll.scrollToIndex(index: 4, controller: controller);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
