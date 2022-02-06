import 'dart:convert';
import 'package:test/features/Authentication/data/models/authenticationModel.dart';
import 'package:test/features/Food/data/models/foodModel.dart';
import 'package:http/http.dart' as http;

class MakataAPI {
  var authority = "ktuapi.bsmtsports.com";
  
  Future<List<Food>> fetchFoods() async {
    Uri url = Uri.http(authority, "/api/food");
    final response = await http.get(url);
    return foodFromJson(response.body);
  }

  Future<AuthResponse> login(AuthRequest authRequest) async {
    var unencodedPath = "/api/user";
    Uri url = Uri.http(authority, unencodedPath);
    final response = await http.post(url, body: authRequest.toJson());
    if (response.statusCode == 200) {
      return AuthResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load data!");
    }
  }
}
