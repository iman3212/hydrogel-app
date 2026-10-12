class ProfileParsing {
  String? username;
  Null? lastLogin;
  String? dateJoined;

  ProfileParsing({this.username, this.lastLogin, this.dateJoined});

  ProfileParsing.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    lastLogin = json['last_login'];
    dateJoined = json['date_joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['username'] = username;
    data['last_login'] = lastLogin;
    data['date_joined'] = dateJoined;
    return data;
  }
}
