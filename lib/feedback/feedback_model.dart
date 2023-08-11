class FeedbackModel {
  List<Data>? data;

  FeedbackModel({this.data});

  FeedbackModel.fromJson(dynamic json) {
    if (json != null) {
      if (json is List) {
        data = json.map((e) => Data.fromJson(e)).toList();
      } else {
        data = [Data.fromJson(json)];
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? value;

  Data({this.id, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}