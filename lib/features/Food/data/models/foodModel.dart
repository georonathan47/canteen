import 'package:meta/meta.dart';
import 'dart:convert';

class Food {
  Food({
    @required this.dataa,
    @required this.message,
    @required this.status,
  });

  List<FoodDetails> dataa;
  String message;
  bool status;

  factory Food.fromRawJson(String str) => Food.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        dataa: List<FoodDetails>.from(
            json["data"].map((x) => FoodDetails.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(dataa.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class FoodDetails {
  FoodDetails({
    @required this.id,
    @required this.foodName,
    @required this.image,
    @required this.price,
    @required this.description,
    @required this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String foodName;
  String image;
  String price;
  String description;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory FoodDetails.fromRawJson(String str) =>
      FoodDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodDetails.fromJson(Map<String, dynamic> json) {
    return FoodDetails(
      id: json["id"],
      foodName: json["food_name"],
      image: json["image"],
      price: json["price"],
      description: json["description"],
      status: json["status"].toString(),
      // createdAt: DateTime.parse(json["created_at"]),
      // updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

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
