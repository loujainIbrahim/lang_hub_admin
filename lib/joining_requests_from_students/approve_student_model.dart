class ApproveRequestsStudentsModel {
  int? status;
  String? message;

  ApproveRequestsStudentsModel({this.status, this.message});

  ApproveRequestsStudentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
