class examModel {
  String? value;
  String? choise1;
  String? choise2;
  String? choise3;
  String? choise4;
  int? correctChoise;

  examModel(
      {this.value,
        this.choise1,
        this.choise2,
        this.choise3,
        this.choise4,
        this.correctChoise});

  examModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    choise1 = json['choise1'];
    choise2 = json['choise2'];
    choise3 = json['choise3'];
    choise4 = json['choise4'];
    correctChoise = json['correct_choise'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['choise1'] = this.choise1;
    data['choise2'] = this.choise2;
    data['choise3'] = this.choise3;
    data['choise4'] = this.choise4;
    data['correct_choise'] = this.correctChoise;
    return data;
  }
}