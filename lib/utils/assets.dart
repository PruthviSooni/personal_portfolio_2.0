import 'package:flutter/material.dart';

import '../widgets/skills_iconGenerator.dart';
import 'colors.dart';

class Assets {
  //Illustration Image paths
  static String personIllustration = 'assets/person.png';
  static String skillsIllustration = 'assets/skills.png';
  static String projectsIllustration = 'assets/projects.png';
  static String certificateIllustration = 'assets/certificates.png';
  static String contactIllustration = 'assets/contact.png';

//  Skills image
  static String skillsScreenshot = 'assets/skillSS.png';

//  Icons path
  static String gitStats =
      "https://github-readme-stats.vercel.app/api?username=pruthvisooni&show_icons=true&theme=dark&text_color=ffff&bg_color=313131&title_color=ca3e47&hide_border=true";
  static String gitLanguage =
      'https://github-readme-stats.vercel.app/api/top-langs/?username=pruthvisooni&hide=kotlin,css,javascript&show_icons=true&theme=default&theme=dark&text_color=ffff&bg_color=313131&title_color=ca3e47&hide_border=true';
  static const java = 'assets/icons/java.png';
  static const android = 'assets/icons/android.png';
  static const python = 'assets/icons/python.png';
  static const javascript = 'assets/icons/javascript.png';
  static const vsCode = 'assets/icons/vscode.png';
  static const git = 'assets/icons/git.png';
  static const github = 'assets/icons/github.png';
  static const mysql = 'assets/icons/mysql.png';
  static const mongodb = 'assets/icons/mongodb.png';
  static const dart = 'assets/icons/dart.png';
  static const flutter = 'assets/icons/flutter.png';
  static const firebase = 'assets/icons/firebase.png';
  static const nodeJS = 'assets/icons/node.js.png';
  static const languages = 'assets/languages.png';
  static const databases = 'assets/databases.png';
  static const technologies = 'assets/technologies.png';
  static const tools = 'assets/tools.png';
  static const language_icon = 'assets/language_icon.png';
  static const tech_icon = 'assets/tech_icon.png';
  static const database_icon = 'assets/database_icon.png';
  static const tools_icons = 'assets/tools_icon.png';

  static List<Widget> iconsList(width) {
    return [
      Image.asset(
        Assets.dart,
        width: width,
      ),
      Image.asset(
        Assets.java,
        width: width,
      ),
      Image.asset(
        Assets.javascript,
        width: width,
      ),
      Image.asset(
        Assets.python,
        width: width,
      ),
      Image.asset(
        Assets.flutter,
        width: width,
      ),
      Image.asset(
        Assets.android,
        width: width,
      ),
      Image.asset(
        Assets.nodeJS,
        width: width,
      ),
      Image.asset(
        Assets.firebase,
        width: width,
      ),
      Image.asset(
        Assets.mysql,
        width: width,
      ),
      Image.asset(
        Assets.mongodb,
        width: width,
      ),
      Image.asset(
        Assets.git,
        width: width,
      ),
      Image.asset(
        Assets.github,
        width: width,
      ),
      Image.asset(
        Assets.vsCode,
        width: width,
      ),
    ];
  }

  static List<Widget> skills(width, BoxConstraints constraints) {
    var size = constraints.maxWidth;
    return [
      Container(
        decoration: BoxDecoration(color: kDarkGrey),
        child: IconGenerator(
          width: width,
          icon: Assets.language_icon,
          image: Assets.languages,
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: size > 1100 ? 10 : 13),
        decoration: BoxDecoration(color: kDarkGrey),
        child: IconGenerator(
          width: width,
          icon: Assets.tools_icons,
          image: Assets.tools,
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: size > 1100 ? 25 : 23),
        decoration: BoxDecoration(color: kDarkGrey),
        child: IconGenerator(
          width: width,
          icon: Assets.tech_icon,
          image: Assets.technologies,
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: size > 1200 ? 25 : 23),
        decoration: BoxDecoration(color: kDarkGrey),
        child: IconGenerator(
          width: width,
          icon: Assets.database_icon,
          image: Assets.databases,
        ),
      ),
    ];
  }
}
