import 'package:floating_action_row/floating_action_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/footer.dart';
import 'package:portfolio/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import './widgets/navBar.dart';
import 'pages/about.dart';
import 'pages/certificates.dart';
import 'pages/contact.dart';
import 'pages/projects.dart';
import 'pages/skills.dart';
import 'provider/app.provider.dart';
import 'utils/colors.dart';
import 'utils/urls.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollDirection = Axis.vertical;
  int counter = 0;
  AutoScrollController _controller;
  List<Widget> screens;
  int pixel = 1040;

  @override
  void initState() {
    super.initState();
    _controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    );
    screens = [
      About(),
      Skills(),
      Projects(),
      Certificates(),
      Contact(),
      Footer()
    ];
  }

  @override
  void didChangeDependencies() {
    Provider.of<AppProvider>(context).fetchCertificates();
    Provider.of<AppProvider>(context).fetchProjects();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: Colors.grey.shade900,
          drawer: constraints.maxWidth < 800
              ? DrawerChild(controller: _controller)
              : null,
          appBar: AppBar(
            title: Text(
              'Portfolio',
              style: GoogleFonts.permanentMarker(fontSize: 32),
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
                          _scrollToIndex(index: index);
                        },
                      ),
                    ),
              constraints.maxWidth > 800
                  ? Container()
                  : Container(
                      margin: EdgeInsets.only(right: 20),
                      child: IconButton(
                        tooltip: 'My Resume',
                        onPressed: () => Urls.showResume,
                        icon: Icon(
                          AntDesign.form,
                          color: kAccentColor,
                        ),
                      ),
                    ),
            ],
          ),
          floatingActionButton: floatingWidget(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: content(constraints, context),
        );
      },
    );
  }

  Widget content(BoxConstraints constraints, BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: scrollDirection,
      controller: _controller,
      itemCount: screens.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int i) {
        return _getRow(i, MediaQuery.of(context).size.height, constraints);
      },
    );
  }

  Future _scrollToIndex({int index}) async {
    await _controller.scrollToIndex(index);
    print(index);
    _controller.highlight(index);
  }

  Widget _getRow(int index, double height, BoxConstraints constraints) {
    return _wrapScrollTag(
        index: index,
        child: Container(
          height: index == 5
              ? 140
              : index == 4
                  ? 550
                  : index == 3
                      ? 500
                      : index == 2
                          ? constraints.biggest.height / 1.5
                          : index == 1
                              ? 650
                              : height,
          child: screens.elementAt(index),
        ));
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
        key: ValueKey(index),
        controller: _controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );

  FloatingActionRow floatingWidget() {
    return FloatingActionRow(
      color: kDarkGrey,
      axis: Axis.horizontal,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
          side: BorderSide(color: kAccentColor)),
      elevation: 0,
      children: <Widget>[
        FloatingActionRowButton(
          icon: Icon(
            AntDesign.twitter,
            color: Colors.blueAccent,
          ),
          color: Colors.transparent,
          onTap: () => Urls.launchTwitter,
        ),
        FloatingActionRowDivider(),
        FloatingActionRowButton(
            icon: Icon(
              AntDesign.youtube,
              color: Colors.redAccent.shade700,
            ),
            onTap: () => Urls.launchYoutube),
        FloatingActionRowDivider(),
        FloatingActionRowButton(
            icon: Icon(
              AntDesign.github,
              color: Colors.white,
            ),
            onTap: () => Urls.launchGithub),
        FloatingActionRowDivider(),
        FloatingActionRowButton(
            icon: Icon(
              AntDesign.linkedin_square,
              color: Colors.lightBlue.shade600,
            ),
            onTap: () => Urls.launchLinkDin),
        FloatingActionRowDivider(),
        FloatingActionRowButton(
            icon: Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
            onTap: () => _scrollToIndex(index: 0)),
      ],
    );
  }
}
