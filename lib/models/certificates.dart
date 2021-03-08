class GetCertificates {
  static String url =
      "https://personal-portfolioapi.herokuapp.com/api/certificates";
  List<Certificates> certificates;

  GetCertificates({this.certificates});

  GetCertificates.fromJson(Map<String, dynamic> json) {
    if (json['certificates'] != null) {
      certificates = <Certificates>[];
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
  String sId;
  String courseName;
  String courseURL;
  String courseImg;
  String createdAt;
  String updatedAt;

  Certificates(
      {this.sId,
      this.courseName,
      this.courseURL,
      this.courseImg,
      this.createdAt,
      this.updatedAt});

  Certificates.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseName = json['courseName'];
    courseURL = json['courseURL'];
    courseImg = json['courseImg'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['courseName'] = this.courseName;
    data['courseURL'] = this.courseURL;
    data['courseImg'] = this.courseImg;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
