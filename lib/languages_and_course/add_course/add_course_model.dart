class AddCourseModel {
  int? status;
  String? message;
  Data? data;

  AddCourseModel({this.status, this.message, this.data});

  AddCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

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
    courseImage = json['course_image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['hours'] = this.hours;
    data['language'] = this.language;
    data['course_image'] = this.courseImage;
    data['id'] = this.id;
    return data;
  }
}