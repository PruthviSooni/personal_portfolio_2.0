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
}
