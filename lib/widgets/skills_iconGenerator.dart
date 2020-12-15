import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';

class IconGenerator extends StatelessWidget {
  final double width;
  final String icon;
  final String image;

  const IconGenerator({Key key, this.width, this.image, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 10),
        Container(
          width: 70,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kDarkGrey,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset(
            icon,
          ),
        ),
        Image.asset(
          image,
          width: width,
        ),
      ],
    );
  }
}
