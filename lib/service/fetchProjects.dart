import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/certificates.dart';
import '../models/projects.dart';
import '../service/fetch_service.dart';

class GetData extends Service {
  @override
  // ignore: missing_return
  Future<List<Projects>> getProjects() async {
    http.Response response = await http.get(ProjectData.url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<Projects> projects = ProjectData.fromJson(json).projects;
      return projects;
    } else {
      print(response.statusCode);
    }
  }

  @override
  Future<List<Certificates>> getCertificates() {
    // TODO: implement getCertificates
    throw UnimplementedError();
  }
}
