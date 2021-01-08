import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/utils/urls.dart';

class FloatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Tooltip(
            message: "Youtube",
            child: FlatButton(
              child: Icon(
                AntDesign.youtube,
                color: Colors.redAccent.shade700,
              ),
              onPressed: () => Urls.launchYoutube,
            ),
          ),
          SizedBox(height: 10),
          Tooltip(
            message: "Github",
            child: FlatButton(
              child: Icon(
                AntDesign.github,
                color: Colors.white,
              ),
              onPressed: () => Urls.launchGithub,
            ),
          ),
          SizedBox(height: 10),
          Tooltip(
            message: "Linkedin",
            child: FlatButton(
              child: Icon(
                AntDesign.linkedin_square,
                color: Colors.lightBlue.shade600,
              ),
              onPressed: () => Urls.launchLinkDin,
            ),
          ),
          SizedBox(height: 10),
          Tooltip(
            message: "Twitter",
            child: FlatButton(
              child: Icon(
                AntDesign.twitter,
                color: Colors.blueAccent,
              ),
              onPressed: () => Urls.launchTwitter,
            ),
          ),
        ],
      ),
    );
  }
}
