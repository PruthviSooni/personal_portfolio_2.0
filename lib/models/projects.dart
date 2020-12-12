class ProjectData {
  static String url =
      'https://raw.githubusercontent.com/PruthviSooni/projects_json/master/projects.json';
  List<Projects> projects;

  ProjectData({this.projects});

  ProjectData.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = new List<Projects>();
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
  String id;
  String title;
  String description;
  String icon;
  String url;

  Projects({this.id, this.title, this.description, this.icon, this.url});

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}
