// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Food> foodFromJson(String str) => List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
    Food({
        @required this.id,
        @required this.foodName,
        @required this.image,
        @required this.price,
        @required this.description,
        @required this.status,
        @required this.createdAt,
        @required this.updatedAt,
    });

    final int id;
    final String foodName;
    final String image;
    final String price;
    final String description;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        foodName: json["food_name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "food_name": foodName,
        "image": image,
        "price": price,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
