class GetCertificates {
  static String url =
      "https://raw.githubusercontent.com/PruthviSooni/projects_json/master/certificates.json";
  List<Certificates> certificates;

  GetCertificates({this.certificates});

  GetCertificates.fromJson(Map<String, dynamic> json) {
    if (json['certificates'] != null) {
      certificates = new List<Certificates>();
      json['certificates'].forEach((v) {
        certificates.add(new Certificates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.certificates != null) {
      data['certificates'] = this.certificates.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Certificates {
  String id;
  String courseName;
  String courseImg;
  String courseURL;

  Certificates({this.id, this.courseName, this.courseImg, this.courseURL});

  Certificates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    courseImg = json['courseImg'];
    courseURL = json['courseURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseName'] = this.courseName;
    data['courseImg'] = this.courseImg;
    data['courseURL'] = this.courseURL;
    return data;
  }
}
