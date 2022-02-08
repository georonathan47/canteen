// import 'dart:convert';

// import 'package:test/features/Authentication/data/models/authenticationModel.dart';
// import 'package:http/http.dart' as http;

// Future<AuthResponse> login(AuthRequest authRequest) async {
//   var authority = "ktuapi.bsmtsports.com";
//   var unencodedPath = "/api/user";
//   Uri url = Uri.http(authority, unencodedPath);
//   final response = await http.post(url, body: authRequest.toJson());
//   if (response.statusCode == 200) {
//     return AuthResponse.fromJson(json.decode(response.body));
//   } else {
//     throw Exception("Failed to load data!");
//   }
// }
