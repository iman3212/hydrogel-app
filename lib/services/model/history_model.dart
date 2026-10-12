//For ph history
class PhHistoryParsing {
  int? count;
  String? next;
  String? previous;
  List<Results> results = [];

  PhHistoryParsing(
      {this.count, this.next, this.previous, required this.results});

  PhHistoryParsing.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      final resultList = json["results"] as List;
      for (var v in resultList) {
        results.add(Results.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? image;
  double? phResult;
  String? date;
  int? user;

  Results({this.id, this.image, this.phResult, this.date, this.user});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    phResult = json['ph_result'];
    date = json['date'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['ph_result'] = phResult;
    data['date'] = date;
    data['user'] = user;
    return data;
  }
}

//For qality history
//.......................................................................................
class QcHistoryParsing {
  int? count;
  String? next;
  String? previous;
  List<QcResults> results = [];

  QcHistoryParsing(
      {this.count, this.next, this.previous, required this.results});

  QcHistoryParsing.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      final listResylts = json["results"] as List;
      for (var v in listResylts) {
        results.add(QcResults.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QcResults {
  int? id;
  String? image;
  bool? distortionResult;
  bool? continuityResult;
  double? width;
  double? height;
  String? date;
  int? user;

  QcResults(
      {this.id,
      this.image,
      this.distortionResult,
      this.continuityResult,
      this.height,
      this.date,
      this.user});

  QcResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    distortionResult = json['distortion_result'];
    continuityResult = json['continuity_result'];
    width = json['width_result'];
    height = json['height_result'];
    date = json['date'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['distortion_result'] = distortionResult;
    data['continuity_result'] = continuityResult;
    data['width_result'] = width;
    data['height_result'] = height;
    data['date'] = date;
    data['user'] = user;
    return data;
  }
}

// For all history
//.......................................................................................

class AllHistoryParsing {
  int? count;
  String? next;
  String? previous;
  ResultsContainer? results; // Change type to ResultsContainer

  AllHistoryParsing({this.count, this.next, this.previous, this.results});

  AllHistoryParsing.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results = json['results'] != null
        ? ResultsContainer.fromJson(json['results'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class ResultsContainer {
  List<Results>? ph;
  List<QcResults>? quality;

  ResultsContainer({this.ph, this.quality});

  ResultsContainer.fromJson(Map<String, dynamic> json) {
    if (json['ph'] != null) {
      ph = List<Results>.from(json['ph'].map((item) => Results.fromJson(item)));
    }
    if (json['quality'] != null) {
      quality = List<QcResults>.from(
          json['quality'].map((item) => QcResults.fromJson(item)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ph != null) {
      data['ph'] = ph!.map((item) => item.toJson()).toList();
    }
    if (quality != null) {
      data['quality'] = quality!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}
