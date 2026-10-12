class PhAi {
  String? phValue;
  double? phNumber;
  

  PhAi({this.phValue, this.phNumber});

  PhAi.fromJson(Map<String, dynamic> json) {
    phValue = json['Height'];
    phNumber = json['continuity'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Height'] = phValue;
    data['continuity'] = phNumber;
    return data;
  }
}