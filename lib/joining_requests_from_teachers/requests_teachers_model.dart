class RequestsTeachersModel {
  int? status;
  String? message;
  List<Data>? data;

  RequestsTeachersModel({this.status, this.message, this.data});

  RequestsTeachersModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? photo;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Time? time;
  Pivot? pivot;
  List<Posts>? posts;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.photo,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.time,
      this.pivot,
      this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    photo = json['photo'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
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
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Time {
  int? id;
  int? saturday;
  String? startSaturday;
  String? endSaturday;
  int? sunday;
  String? startSunday;
  String? endSunday;
  int? monday;
  String? startMonday;
  String? endMonday;
  int? tuesday;
  String? startTuesday;
  String? endTuesday;
  int? wednsday;
  String? startWednsday;
  String? endWednsday;
  int? thursday;
  String? startThursday;
  String? endThursday;
  int? friday;
  String? startFriday;
  String? endFriday;
  int? academyTeacherId;
  String? createdAt;
  String? updatedAt;

  Time(
      {this.id,
      this.saturday,
      this.startSaturday,
      this.endSaturday,
      this.sunday,
      this.startSunday,
      this.endSunday,
      this.monday,
      this.startMonday,
      this.endMonday,
      this.tuesday,
      this.startTuesday,
      this.endTuesday,
      this.wednsday,
      this.startWednsday,
      this.endWednsday,
      this.thursday,
      this.startThursday,
      this.endThursday,
      this.friday,
      this.startFriday,
      this.endFriday,
      this.academyTeacherId,
      this.createdAt,
      this.updatedAt});

  Time.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saturday = json['saturday'];
    startSaturday = json['start_saturday'];
    endSaturday = json['end_saturday'];
    sunday = json['sunday'];
    startSunday = json['start_sunday'];
    endSunday = json['end_sunday'];
    monday = json['monday'];
    startMonday = json['start_monday'];
    endMonday = json['end_monday'];
    tuesday = json['tuesday'];
    startTuesday = json['start_tuesday'];
    endTuesday = json['end_tuesday'];
    wednsday = json['wednsday'];
    startWednsday = json['start_wednsday'];
    endWednsday = json['end_wednsday'];
    thursday = json['thursday'];
    startThursday = json['start_thursday'];
    endThursday = json['end_thursday'];
    friday = json['friday'];
    startFriday = json['start_friday'];
    endFriday = json['end_friday'];
    academyTeacherId = json['academy_teacher_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['saturday'] = this.saturday;
    data['start_saturday'] = this.startSaturday;
    data['end_saturday'] = this.endSaturday;
    data['sunday'] = this.sunday;
    data['start_sunday'] = this.startSunday;
    data['end_sunday'] = this.endSunday;
    data['monday'] = this.monday;
    data['start_monday'] = this.startMonday;
    data['end_monday'] = this.endMonday;
    data['tuesday'] = this.tuesday;
    data['start_tuesday'] = this.startTuesday;
    data['end_tuesday'] = this.endTuesday;
    data['wednsday'] = this.wednsday;
    data['start_wednsday'] = this.startWednsday;
    data['end_wednsday'] = this.endWednsday;
    data['thursday'] = this.thursday;
    data['start_thursday'] = this.startThursday;
    data['end_thursday'] = this.endThursday;
    data['friday'] = this.friday;
    data['start_friday'] = this.startFriday;
    data['end_friday'] = this.endFriday;
    data['academy_teacher_id'] = this.academyTeacherId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Pivot {
  int? academyId;
  int? teacherId;

  Pivot({this.academyId, this.teacherId});

  Pivot.fromJson(Map<String, dynamic> json) {
    academyId = json['academy_id'];
    teacherId = json['teacher_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['academy_id'] = this.academyId;
    data['teacher_id'] = this.teacherId;
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? image;
  int? teacherId;
  String? createdAt;
  String? updatedAt;

  Posts(
      {this.id,
      this.title,
      this.image,
      this.teacherId,
      this.createdAt,
      this.updatedAt});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    teacherId = json['teacher_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['teacher_id'] = this.teacherId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
