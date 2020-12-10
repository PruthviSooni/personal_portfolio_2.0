import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';

class Certificates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: kLightGrey,
      height: size.height,
      width: size.width,
      child: Center(
        child: Text(
          'Certificates Screen',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
