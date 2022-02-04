import 'dart:convert';
import 'foodModel.dart';
import 'package:http/http.dart' as http;

class FoodAPI {
  static Future<List<Food>> getFoods() async {
    var request =
        http.Request('GET', Uri.parse('ktuapi.bsmtsports.com/api/food'));

    http.StreamedResponse responses = await request.send();

    if (responses.statusCode == 200) {
      print(await responses.stream.bytesToString());
    } else {
      print(responses.reasonPhrase);
    }
    // change autority to host name
    var uri = Uri.http("ktuapi.bsmtsports.com", "/api/food");

    final response = await http.get(uri, headers: {});

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['food']) {
      _temp.add(i['']);
    }

    return Food.foodFromAPI(_temp);
  }
}
