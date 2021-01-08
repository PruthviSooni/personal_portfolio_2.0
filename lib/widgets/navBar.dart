import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  final Function onTap;

  const NavBar({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: TabBar(
        indicatorColor: Colors.transparent,
        onTap: onTap,
        indicator: BoxDecoration(),
        tabs: [
          Tab(
            child: Text(
              'About',
              style: GoogleFonts.raleway(),
            ),
          ),
          Tab(
            child: Text(
              'Skills',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(),
            ),
          ),
          Tab(
            child: Text(
              'Projects',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(),
            ),
          ),
          Tab(
            child: Text('Certificates'),
          ),
          Tab(
            child: Text(
              'Contact',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(),
            ),
          ),
        ],
      ),
    );
  }
}
