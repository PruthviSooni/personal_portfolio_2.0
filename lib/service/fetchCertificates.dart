import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/certificates.dart';
import '../models/projects.dart';
import '../service/fetch_service.dart';

class GetData extends Service {
  @override
  // ignore: missing_return
  Future<List<Certificates>> getCertificates() async {
    http.Response response = await http.get(GetCertificates.url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<Certificates> certificates =
          GetCertificates.fromJson(json).certificates;
      return certificates;
    } else {
      print(response.statusCode);
    }
  }

  @override
  Future<List<Projects>> getProjects() {
    // TODO: implement getProjects
    throw UnimplementedError();
  }
}
