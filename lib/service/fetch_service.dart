import '../models/certificates.dart';
import '../models/projects.dart';

abstract class Service {
  Future<List<Projects>> getProjects();

  Future<List<Certificates>> getCertificates();
}
