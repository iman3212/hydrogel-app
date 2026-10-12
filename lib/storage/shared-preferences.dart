import 'package:shared_preferences/shared_preferences.dart';

class TokenService {

  static const String _tokenKey = 'token';
   static const String _usernameKey = 'username';
  static const String _loginDateKey = 'login_date';

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

   static Future<void> saveUserInfo(String username, DateTime loginDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    await prefs.setString(_loginDateKey, loginDate.toIso8601String());
  }

  static Future<Map<String, dynamic>?> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString(_usernameKey);
    String? loginDateStr = prefs.getString(_loginDateKey);
    DateTime? loginDate;
    if (loginDateStr != null) {
      loginDate = DateTime.parse(loginDateStr);
    }
    return {'username': username, 'login_date': loginDate};
  }
}
