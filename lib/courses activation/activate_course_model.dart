class ActivateCourseModel {
  int? status;
  String? message;
  List<Data>? data;

  ActivateCourseModel({this.status, this.message, this.data});

  ActivateCourseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? price;
  int? hours;
  String? courseImage;
  int? seats;
  String? description;
  int? hasExam;
  String? language;
  String? startDate;
  String? endDate;

  Data(
      {this.id,
        this.name,
        this.price,
        this.hours,
        this.courseImage,
        this.seats,
        this.description,
        this.hasExam,
        this.language,
        this.startDate,
        this.endDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    hours = json['hours'];
    courseImage = json['course_image'];
    seats = json['seats'];
    description = json['description'];
    hasExam = json['hasExam'];
    language = json['language'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['hours'] = this.hours;
    data['course_image'] = this.courseImage;
    data['seats'] = this.seats;
    data['description'] = this.description;
    data['hasExam'] = this.hasExam;
    data['language'] = this.language;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}