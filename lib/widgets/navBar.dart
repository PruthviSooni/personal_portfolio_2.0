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
        tabs: [
          Tab(
            child: Text(
              'About',
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            child: Text('Skills', textAlign: TextAlign.center),
          ),
          Tab(
            child: Text('Projects', textAlign: TextAlign.center),
          ),
          Tab(
            child: Text('Certificates', textAlign: TextAlign.center),
          ),
          Tab(
            child: Text('Contact', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
