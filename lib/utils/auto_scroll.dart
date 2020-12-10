import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../pages/about.dart';
import '../pages/certificates.dart';
import '../pages/contact.dart';
import '../pages/projects.dart';
import '../pages/skills.dart';

class AutoScroll {
  static List<Widget> screens = [
    About(),
    Skills(),
    Projects(),
    Certificates(),
    Contact(),
  ];
  static Future scrollToIndex({int index, controller}) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
  }

  // static Widget getRow(
  //     int index, double height, AutoScrollController controller) {
  //   return _wrapScrollTag(
  //       index: index,
  //       controller: controller,
  //       child: Container(
  //         alignment: Alignment.topCenter,
  //         height: height,
  //         child: screens.elementAt(index),
  //       ));
  // }
  //
  // static Widget _wrapScrollTag(
  //         {int index, Widget child, AutoScrollController controller}) =>
  //     AutoScrollTag(
  //       key: ValueKey(index),
  //       controller: controller,
  //       index: index,
  //       child: child,
  //       highlightColor: Colors.black.withOpacity(0.1),
  //     );
}
