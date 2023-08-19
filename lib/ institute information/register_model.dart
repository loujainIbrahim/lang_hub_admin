class RegisterModel {
  bool? status;
  String? massage;
  Data? data;
  String? token;

  RegisterModel({this.status, this.massage, this.data, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massage'] = this.massage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.firstName,
        this.lastName,
        this.phoneNumber,
        this.userId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}