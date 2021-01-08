import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/certificates.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/urls.dart';

class CertificatesWidget extends StatelessWidget {
  final Certificates certificate;
  final BoxConstraints constraints;
  const CertificatesWidget({Key key, this.certificate, this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(constraints,
        designSize: Size(
          constraints.biggest.width,
          constraints.biggest.height,
        ));
    var size = MediaQuery.of(context).size;
    return Container(
      width: constraints.maxWidth < 500 ? 250 : 400,
      height: constraints.maxHeight < 500 ? 250 : 400,
      child: Card(
        color: kLightGrey,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadowColor: Colors.grey.shade800,
        margin: EdgeInsets.all(12),
        child: InkWell(
          onTap: () => Urls.launchUrl(certificate.courseURL),
          // hoverColor: Colors.grey.shade900,
          splashColor: kDarkGrey,
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: certificate.courseImg,
                  fit: BoxFit.cover,
                  width: size.width,
                  height: size.height,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Text(
                    error.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, right: 20),
                alignment: Alignment.topRight,
                child: Icon(
                  FontAwesome.external_link,
                  color: kAccentColor,
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Colors.black, Colors.black26],
                    )),
                child: Text(
                  certificate.courseName,
                  style: GoogleFonts.raleway(fontSize: 18, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
