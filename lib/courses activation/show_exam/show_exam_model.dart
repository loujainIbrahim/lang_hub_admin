class ShowExamModel {
  int? status;
  String? message;
  Data? data;

  ShowExamModel({this.status, this.message, this.data});

  ShowExamModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? courseId;
  String? createdAt;
  String? updatedAt;
  List<Questions>? questions;

  Data(
      {this.id, this.courseId, this.createdAt, this.updatedAt, this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  int? examId;
  String? value;
  String? choise1;
  String? choise2;
  String? choise3;
  int? correctChoise;
  String? createdAt;
  String? updatedAt;

  Questions(
      {this.id,
      this.examId,
      this.value,
      this.choise1,
      this.choise2,
      this.choise3,
      this.correctChoise,
      this.createdAt,
      this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    value = json['value'];
    choise1 = json['choise1'];
    choise2 = json['choise2'];
    choise3 = json['choise3'];
    correctChoise = json['correct_choise'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exam_id'] = this.examId;
    data['value'] = this.value;
    data['choise1'] = this.choise1;
    data['choise2'] = this.choise2;
    data['choise3'] = this.choise3;
    data['correct_choise'] = this.correctChoise;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}