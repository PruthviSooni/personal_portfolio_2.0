import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: kDarkGrey,
      height: size.height,
      width: size.width,
      child: Center(
        child: Text(
          'Contact Screen',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
