class ResponseAddExamModel {
  int? statise;
  String? message;
  List<Data>? data;

  ResponseAddExamModel({this.statise, this.message, this.data});

  ResponseAddExamModel.fromJson(Map<String, dynamic> json) {
    statise = json['statise'];
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
    data['statise'] = this.statise;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? examId;
  String? value;
  String? choise1;
  String? choise2;
  String? choise3;
  int? correctChoise;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.examId,
        this.value,
        this.choise1,
        this.choise2,
        this.choise3,
        this.correctChoise,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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