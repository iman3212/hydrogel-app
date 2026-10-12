class QcAi {
  bool? wave;
  bool? continuity;
  double? width;
    double? height;


  QcAi({this.wave, this.continuity, this.width, this.height});

  QcAi.fromJson(Map<String, dynamic> json) {
    wave = json['distortion_result'];
    continuity = json['continuity_result'];
    width = json['height_result'];
    height = json['width_result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Height'] = height;
    data['continuity'] = continuity;
    data['wave'] = wave;
    data['width'] = width;
    return data;
  }
}
