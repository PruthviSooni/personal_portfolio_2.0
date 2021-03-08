import 'package:flutter/cupertino.dart';
import 'package:portfolio/models/certificates.dart';
import 'package:portfolio/models/projects.dart';
import 'package:portfolio/service/fetchCertificates.dart';
import 'package:portfolio/service/fetchProjects.dart';

class AppProvider with ChangeNotifier {
  List<Certificates> _certificates = [];
  List<Projects> _projects = [];
  List<Projects> reversed = [];
  bool _projectLoad = false;
  bool _certificateLoad = false;

  bool get certificateLoad => _certificateLoad;
  bool get projectLoad => _projectLoad;

  List<Certificates> get certificates => _certificates;
  List<Projects> get projects => reversed;
  Future fetchCertificates() async {
    _certificateLoad = true;
    _certificates = await GetCertificateData().getCertificates();
    _certificateLoad = false;
    notifyListeners();
    return _certificates;
  }

  Future fetchProjects() async {
    _projectLoad = true;
    _projects = await GetProjectData().getProjects();
    reversed = _projects.reversed.toList();
    _projectLoad = false;
    notifyListeners();
    return reversed;
  }
}
