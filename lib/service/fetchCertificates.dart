import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/certificates.dart';
import '../models/projects.dart';
import '../service/fetch_service.dart';

class GetCertificateData extends Service {
  @override
  // ignore: missing_return
  Future<List<Certificates>> getCertificates() async {
    http.Response response = await http.get(GetCertificates.url);
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List<Certificates> certificates =
            GetCertificates.fromJson(json).certificates;
        return certificates;
      } else {
        print(response.statusCode);
      }
    } on HttpException catch (e) {
      print(e);
    }
  }

  @override
  Future<List<Projects>> getProjects() {
    throw UnimplementedError();
  }
}
