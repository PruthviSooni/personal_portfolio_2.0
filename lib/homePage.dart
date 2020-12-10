import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/drawer.dart';
import 'package:portfolio/widgets/floating_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import './widgets/navBar.dart';
import 'pages/about.dart';
import 'pages/certificates.dart';
import 'pages/contact.dart';
import 'pages/projects.dart';
import 'pages/skills.dart';

enum Screen {
  LandingPage,
  AboutPage,
  SkillPage,
  CertificatePage,
  ProjectPage,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollDirection = Axis.vertical;
  int counter = 0;
  TabController tabController;
  List<Widget> screens = [
    About(),
    Skills(),
    Projects(),
    Certificates(),
    Contact(),
  ];

  AutoScrollController controller;
  List<List<int>> list;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    list = List.generate(5, (index) => <int>[index, 3]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          // extendBodyBehindAppBar: true,
          backgroundColor: Colors.grey.shade900,
          drawer: constraints.maxWidth < 800
              ? Drawer(
                  child: DrawerChild(controller: controller),
                )
              : null,
          appBar: AppBar(
            title: Text(
              'Portfolio',
              style: GoogleFonts.permanentMarker(),
            ),
            centerTitle: constraints.maxWidth < 800 ? true : false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 100,
            actions: [
              constraints.maxWidth < 800
                  ? Container()
                  : Container(
                      width: size.width / 2,
                      child: NavBar(
                        onTap: (index) async {
                          scrollToIndex(index: index);
                        },
                      ),
                    ),
            ],
          ),
          floatingActionButton: FloatingWidget(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          body: ListView(
            scrollDirection: scrollDirection,
            controller: controller,
            children: list.map<Widget>((data) {
              return _getRow(
                data[0],
                MediaQuery.of(context).size.height,
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Future scrollToIndex({int index}) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
  }

  Widget _getRow(int index, double height) {
    return _wrapScrollTag(
        index: index,
        child: Container(
          alignment: Alignment.topCenter,
          height: height,
          child: screens.elementAt(index),
        ));
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );
}
