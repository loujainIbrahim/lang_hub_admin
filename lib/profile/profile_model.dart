class ProfileModel {
  int? status;
  String? message;
  Data? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  PersonalInfo? personalInfo;
  AcademyInfo? academyInfo;

  Data({this.personalInfo, this.academyInfo});

  Data.fromJson(Map<String, dynamic> json) {
    personalInfo = json['personal_info'] != null
        ? new PersonalInfo.fromJson(json['personal_info'])
        : null;
    academyInfo = json['academy_info'] != null
        ? new AcademyInfo.fromJson(json['academy_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalInfo != null) {
      data['personal_info'] = this.personalInfo!.toJson();
    }
    if (this.academyInfo != null) {
      data['academy_info'] = this.academyInfo!.toJson();
    }
    return data;
  }
}

class PersonalInfo {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? photo;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  PersonalInfo(
      {this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.photo,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    photo = json['photo'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['photo'] = this.photo;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  Null? emailVerifiedAt;
  int? roleId;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.email,
        this.emailVerifiedAt,
        this.roleId,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role_id'] = this.roleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AcademyInfo {
  int? id;
  String? name;
  String? description;
  String? location;
  String? licenseNumber;
  int? english;
  int? germany;
  int? spanish;
  int? french;
  String? photo;
  Null? image;
  int? deleteTime;
  int? academyAdminstratorId;
  String? createdAt;
  String? updatedAt;

  AcademyInfo(
      {this.id,
        this.name,
        this.description,
        this.location,
        this.licenseNumber,
        this.english,
        this.germany,
        this.spanish,
        this.french,
        this.photo,
        this.image,
        this.deleteTime,
        this.academyAdminstratorId,
        this.createdAt,
        this.updatedAt});

  AcademyInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    location = json['location'];
    licenseNumber = json['license_number'];
    english = json['english'];
    germany = json['germany'];
    spanish = json['spanish'];
    french = json['french'];
    photo = json['photo'];
    image = json['image'];
    deleteTime = json['delete_time'];
    academyAdminstratorId = json['academy_adminstrator_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['location'] = this.location;
    data['license_number'] = this.licenseNumber;
    data['english'] = this.english;
    data['germany'] = this.germany;
    data['spanish'] = this.spanish;
    data['french'] = this.french;
    data['photo'] = this.photo;
    data['image'] = this.image;
    data['delete_time'] = this.deleteTime;
    data['academy_adminstrator_id'] = this.academyAdminstratorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}