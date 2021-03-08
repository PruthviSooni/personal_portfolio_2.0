import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/provider/app.provider.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/widgets/certificates_widget.dart';
import 'package:provider/provider.dart';

import '../models/certificates.dart' as certificates;

class Certificates extends StatefulWidget {
  @override
  _CertificatesState createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return pageView(constraints, context);
      });

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    return Container(
      color: kDarkGrey,
      child: Builder(builder: (context) {
        if (Provider.of<AppProvider>(context, listen: false).certificateLoad) {
          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text(
                  'Certificates Overview',
                  style: GoogleFonts.raleway(fontSize: 26, color: Colors.white),
                ),
              ),
              Flexible(
                child: Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: Provider.of<AppProvider>(context, listen: false)
                        .certificates
                        .length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (BuildContext context, int index) {
                      var item =
                          Provider.of<AppProvider>(context, listen: false)
                              .certificates[index];
                      return CertificatesWidget(
                          constraints: constraints,
                          certificate: certificates.Certificates(
                            courseImg: item.courseImg,
                            courseName: item.courseName,
                            courseURL: item.courseURL,
                          ));
                    },
                  ),
                ),
              )
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
