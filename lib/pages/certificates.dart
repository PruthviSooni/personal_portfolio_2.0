import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/certificates.dart'as certificates;
import 'package:portfolio/service/fetchCertificates.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/widgets/certificates_widget.dart';

class Certificates extends StatefulWidget {
  @override
  _CertificatesState createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
  List<certificates.Certificates> _certificates;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    _certificates = await GetData().getCertificates();
    return _certificates;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print(constraints.maxWidth);
      return pageView(constraints, context);
    });
  }

  Widget pageView(BoxConstraints constraints, BuildContext context) {
    return Container(
      color: kDarkGrey,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.hasData
                  ? Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Projects Overview',
                            style: GoogleFonts.raleway(
                                fontSize: 26, color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 400,
                          margin: EdgeInsets.all(20),
                          child: GridView.builder(
                            itemCount: _certificates.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return CertificatesWidget(certificate: certificates.Certificates(
                                courseImg: _certificates[index].courseImg,
                                courseName: _certificates[index].courseName,
                                courseURL: _certificates[index].courseURL,
                              )
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1),
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: Text(snapshot.error.toString()),
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
