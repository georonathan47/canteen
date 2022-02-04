// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';

class Food {
  final String food_name, description, imageURL;
  final double lgprice, smprice;

  Food({
    @required this.food_name,
    @required this.smprice,
    // @required this.mdprice,
    @required this.description,
    this.imageURL,
    this.lgprice,
  });

  factory Food.fromJson(dynamic json) {
    return Food(
      food_name: json['food_name'] as String,
      // imageURL: json['image'] as String,
      description: json['description'] as String,
      smprice: json['price'] as double,
      // mdprice: json["mdprice"] as double,
      // lgprice: json['lgprice'] as double,
      // deliveryPrice: json['deliveryPrice'] as double,
    );
  }
  static List<Food> foodFromAPI(List snapshot) {
    return snapshot.map((data) {
      return Food.fromJson(data);
    }).toList();
  }

  // static List<Food> foodsAvailable = [
  //   Food(
  //     name: "Jollof Rice",
  //     description: "Assorted Jollof Rice with beef or chicken",
  //     imageURL:
  //         "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/42788e49474248dba75fdfd47114024a/BFV43575_PartyRiceAroundAfrica-FB-V2.jpg?output-format=auto&output-quality=auto&resize=600:*",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Fried Rice",
  //     description: "Fried Rice with beef or chicken",
  //     imageURL: "https://avnash.com/recipes/assets/img/recipe15.jpg",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Fufu ",
  //     description: "Fufu with Abɛnkwan plus Beef, Tilapia or Chicken",
  //     imageURL:
  //         "https://cdn.shopify.com/s/files/1/0121/2950/1242/articles/edf516a1ea586d366c40471f8ae5ba5e_800x.jpg?v=1590425707",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Ampesie",
  //     description: "Ampesie with Kontonmire and Tilapia",
  //     imageURL:
  //         "https://i.pinimg.com/originals/68/c8/0a/68c80a72fad86e0d3b9a0cff4d57f695.jpg",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Jollof Rice",
  //     description: "Assorted Jollof Rice with beef or chicken",
  //     imageURL:
  //         "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/42788e49474248dba75fdfd47114024a/BFV43575_PartyRiceAroundAfrica-FB-V2.jpg?output-format=auto&output-quality=auto&resize=600:*",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Fried Rice",
  //     description: "Fried Rice with beef or chicken",
  //     imageURL: "https://avnash.com/recipes/assets/img/recipe15.jpg",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Fufu ",
  //     description: "Fufu with Ab3nkwan plus Beef, Tilapia or Chicken",
  //     imageURL:
  //         "https://cdn.shopify.com/s/files/1/0121/2950/1242/articles/edf516a1ea586d366c40471f8ae5ba5e_800x.jpg?v=1590425707",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Ampesie",
  //     description: "Ampesie with Kontonmire and Tilapia",
  //     imageURL:
  //         "https://i.pinimg.com/originals/68/c8/0a/68c80a72fad86e0d3b9a0cff4d57f695.jpg",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Jollof Rice",
  //     description: "Assorted Jollof Rice with beef or chicken",
  //     imageURL:
  //         "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/42788e49474248dba75fdfd47114024a/BFV43575_PartyRiceAroundAfrica-FB-V2.jpg?output-format=auto&output-quality=auto&resize=600:*",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Fried Rice",
  //     description: "Fried Rice with beef or chicken",
  //     imageURL: "https://avnash.com/recipes/assets/img/recipe15.jpg",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Fufu ",
  //     description: "Fufu with Abɛnkwan plus Beef, Tilapia or Chicken",
  //     imageURL:
  //         "https://cdn.shopify.com/s/files/1/0121/2950/1242/articles/edf516a1ea586d366c40471f8ae5ba5e_800x.jpg?v=1590425707",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  //   Food(
  //     name: "Ampesie",
  //     description: "Ampesie with Kontonmire and Tilapia",
  //     imageURL:
  //         "https://i.pinimg.com/originals/68/c8/0a/68c80a72fad86e0d3b9a0cff4d57f695.jpg",
  //     lgprice: 15,
  //     mdprice: 12,
  //     smprice: 10,
  //     deliveryPrice: 3,
  //   ),
  // ];
}
