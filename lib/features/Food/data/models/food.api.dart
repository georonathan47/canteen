import 'dart:convert';
import 'foodModel.dart';
import 'package:http/http.dart' as http;

Future<List<Food>> fetchFoods() async {
  Uri url = Uri.http("ktuapi.bsmtsports.com", "/api/food");
  final response = await http.get(url);
  return foodFromJson(response.body);
}
