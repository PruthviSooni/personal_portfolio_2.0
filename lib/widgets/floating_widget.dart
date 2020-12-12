import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/utils/urls.dart';

class FloatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 100,
      height: 500,
      padding: EdgeInsets.only(right: 20),
      margin: EdgeInsets.only(top: size.height / 1.3),
      alignment: Alignment.bottomRight,
      child: Row(
        children: [
          Column(
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
          )
        ],
      ),
    );
  }
}
