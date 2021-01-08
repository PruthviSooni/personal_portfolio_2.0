import 'package:url_launcher/url_launcher.dart';

class Urls {
  static void get launchYoutube => _launchYoutube();

  static void get launchGithub => _launchGit();

  static void get launchTwitter => _launchTwitter();

  static void get launchLinkDin => _launchLinkDin();

  static void get showResume => _showResume();
  static void get launchMail => _launchMail();

  static _launchYoutube() async {
    const url = 'https://www.youtube.com/channel/UCVw1XqwQlvpRcktMaSyVY_g';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static _showResume() async {
    const url = 'https://drive.google.com/file/d/1cpMy0gz7qzhFmOQ26P0rSTsQXH4S-Tt2/view';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static _launchGit() async {
    const url = 'https://github.com/PruthviSooni';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static _launchLinkDin() async {
    const url = 'https://www.linkedin.com/in/pruthvi-sooni';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static _launchTwitter() async {
    const url = 'https://twitter.com/PruthviSooni';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static _launchMail() async {
    const url =
        'https://mail.google.com/mail/u/0/?view=cm&fs=1&to=pruthvisoni7@gmail.com&su=SUBJECT&body=BODY&tf=1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
