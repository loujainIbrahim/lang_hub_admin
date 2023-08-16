class OfferModel {
  int? status;
  String? message;
  List<Data>? data;

  OfferModel({this.status, this.message, this.data});

  OfferModel.fromJson(Map<String, dynamic> json) {
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
  String? hours;
  String? startDate;
  String? endDate;
  String? description;
  String? image;
  int? seats;
  List<AnnualSchedules>? annualSchedules;

  Data(
      {this.id,
        this.name,
        this.price,
        this.hours,
        this.startDate,
        this.endDate,
        this.description,
        this.image,
        this.seats,
        this.annualSchedules});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    hours = json['hours'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    image = json['image'];
    seats = json['seats'];
    if (json['annual_schedules'] != null) {
      annualSchedules = <AnnualSchedules>[];
      json['annual_schedules'].forEach((v) {
        annualSchedules!.add(new AnnualSchedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['hours'] = this.hours;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['description'] = this.description;
    data['image'] = this.image;
    data['seats'] = this.seats;
    if (this.annualSchedules != null) {
      data['annual_schedules'] =
          this.annualSchedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnnualSchedules {
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
  int? offerId;
  String? createdAt;
  String? updatedAt;

  AnnualSchedules(
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
        this.offerId,
        this.createdAt,
        this.updatedAt});

  AnnualSchedules.fromJson(Map<String, dynamic> json) {
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
    offerId = json['offer_id'];
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
    data['offer_id'] = this.offerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}