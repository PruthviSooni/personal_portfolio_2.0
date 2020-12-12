import 'package:flutter/material.dart';

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
            ),
          ),
          Tab(
            child: Text('Skills', textAlign: TextAlign.center),
          ),
          Tab(
            child: Text('Projects', textAlign: TextAlign.center),
          ),
          Tab(
            child: Text('Certificates'),
          ),
          Tab(
            child: Text('Contact', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
