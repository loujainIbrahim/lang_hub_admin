class Data {
  String? name;
  String? description;
  String? hours;
  String? language;
  String? courseImage;
  int? id;

  Data(
      {this.name,
        this.description,
        this.hours,
        this.language,
        this.courseImage,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    hours = json['hours'];
    language = json['language'];
    if (json['course_image'] is String && json['course_image'].isEmpty) {
      courseImage = null;
    } else {
      courseImage = json['course_image'];
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['hours'] = this.hours;
    data['language'] = this.language;
    data['course_image'] = this.courseImage ?? ''; // Set to empty string if null
    data['id'] = this.id;
    return data;
  }
}