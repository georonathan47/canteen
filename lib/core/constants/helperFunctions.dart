import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedInKey = "LoggedIn";
  static String userNameKey = "UserNameKey";
  static String userEmailKey = "UserEmailKey";

  // Obtain shared preferences.
  // static Future<bool> saveRemoteFoodName(List<Map<String, dynamic>> data) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // return await prefs.setStringList(userEmailKey, data);
  // }
  // static Future<bool> saveRemoteImage(String data) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return await prefs.setString(userEmailKey, data);
  // }
  // static Future<bool> saveRemoteData(String data) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return await prefs.setString(userEmailKey, data);
  // }
}
