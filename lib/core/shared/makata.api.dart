import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/features/Authentication/data/models/authenticationModel.dart';
import 'package:http/http.dart' as http;

class MakataAPI {
  var authority = "ktuapi.bsmtsports.com";
  var token;

  Future<http.Response> fetchFoods() async {
    var authority = "ktuapi.bsmtsports.com";
    final url = Uri.http(authority, "/api/food");
    final response = await http.get(url);
    return response;
  }

  Future<AuthResponse> login(AuthRequest authRequest) async {
    var unencodedPath = "/api/login";
    Uri url = Uri.http(authority, unencodedPath);
    final response = await http.post(url, body: authRequest.toJson());
    if (response.statusCode == 200) {
      return AuthResponse.fromJson(json.decode(response.body));
    } else {
      // throw Exception("Failed to load data!");
      return null;
    }
  }

  register(userMap) async {
    var unencodedPath = "/api/register";
    Uri url = Uri.https(authority, unencodedPath);
    final response = await http.post(url, body: userMap);
    if (response.statusCode == 200) {
      return AuthResponse.fromJson(json.decode(response.body));
    } else {
      // throw Exception("Failed to load data!");
      return null;
    }
  }

  /// New methods
  ///

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  authData(data, apiUrl) async {
    var unencodedPath = "/api/register";
    Uri fullUrl = Uri.http(authority, unencodedPath);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  getData(apiUrl) async {
    Uri fullUrl = (authority + apiUrl) as Uri;
    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
