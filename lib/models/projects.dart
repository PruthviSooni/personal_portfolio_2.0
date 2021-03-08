class ProjectData {
  static String url =
      'https://personal-portfolioapi.herokuapp.com/api/projects';
  List<Projects> projects;

  ProjectData({this.projects});

  ProjectData.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  List<String> technologies;
  String sId;
  String title;
  String description;
  String icon;
  String url;
  String createdAt;
  String updatedAt;

  Projects(
      {this.technologies,
      this.sId,
      this.title,
      this.description,
      this.icon,
      this.url,
      this.createdAt,
      this.updatedAt});

  Projects.fromJson(Map<String, dynamic> json) {
    technologies = json['technologies'].cast<String>();
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['technologies'] = this.technologies;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
