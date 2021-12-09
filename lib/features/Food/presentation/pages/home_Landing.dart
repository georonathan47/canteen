// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/features/Food/data/models/foodModel.dart';
import 'package:test/features/Food/presentation/widgets/foodList.dart';

class homeLanding extends StatefulWidget {
  const homeLanding({Key? key}) : super(key: key);

  @override
  _homeLandingState createState() => _homeLandingState();
}

class _homeLandingState extends State<homeLanding> {
  @override
  Widget build(BuildContext context) {
    List<Food> foodsAvailable = [
      const Food(
        name: "Jollof Rice",
        description: "Assorted Jollof Rice with beef or chicken",
        imageURL:
            "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/42788e49474248dba75fdfd47114024a/BFV43575_PartyRiceAroundAfrica-FB-V2.jpg?output-format=auto&output-quality=auto&resize=600:*",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Fried Rice",
        description: "Fried Rice with beef or chicken",
        imageURL: "https://avnash.com/recipes/assets/img/recipe15.jpg",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Fufu ",
        description: "Fufu with Ab3nkwan plus Beef, Tilapia or Chicken",
        imageURL:
            "https://cdn.shopify.com/s/files/1/0121/2950/1242/articles/edf516a1ea586d366c40471f8ae5ba5e_800x.jpg?v=1590425707",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Ampesie",
        description: "Ampesie with Kontonmire and Tilapia",
        imageURL:
            "https://i.pinimg.com/originals/68/c8/0a/68c80a72fad86e0d3b9a0cff4d57f695.jpg",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Jollof Rice",
        description: "Assorted Jollof Rice with beef or chicken",
        imageURL:
            "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/42788e49474248dba75fdfd47114024a/BFV43575_PartyRiceAroundAfrica-FB-V2.jpg?output-format=auto&output-quality=auto&resize=600:*",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Fried Rice",
        description: "Fried Rice with beef or chicken",
        imageURL: "https://avnash.com/recipes/assets/img/recipe15.jpg",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Fufu ",
        description: "Fufu with Ab3nkwan plus Beef, Tilapia or Chicken",
        imageURL:
            "https://cdn.shopify.com/s/files/1/0121/2950/1242/articles/edf516a1ea586d366c40471f8ae5ba5e_800x.jpg?v=1590425707",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Ampesie",
        description: "Ampesie with Kontonmire and Tilapia",
        imageURL:
            "https://i.pinimg.com/originals/68/c8/0a/68c80a72fad86e0d3b9a0cff4d57f695.jpg",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Jollof Rice",
        description: "Assorted Jollof Rice with beef or chicken",
        imageURL:
            "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/42788e49474248dba75fdfd47114024a/BFV43575_PartyRiceAroundAfrica-FB-V2.jpg?output-format=auto&output-quality=auto&resize=600:*",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Fried Rice",
        description: "Fried Rice with beef or chicken",
        imageURL: "https://avnash.com/recipes/assets/img/recipe15.jpg",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Fufu ",
        description: "Fufu with Ab3nkwan plus Beef, Tilapia or Chicken",
        imageURL:
            "https://cdn.shopify.com/s/files/1/0121/2950/1242/articles/edf516a1ea586d366c40471f8ae5ba5e_800x.jpg?v=1590425707",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
      const Food(
        name: "Ampesie",
        description: "Ampesie with Kontonmire and Tilapia",
        imageURL:
            "https://i.pinimg.com/originals/68/c8/0a/68c80a72fad86e0d3b9a0cff4d57f695.jpg",
        lgprice: 15,
        mdprice: 12,
        smprice: 10,
      ),
    ];

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: foodsAvailable.length,
        itemBuilder: (context, index) {
          return FoodList(
            name: foodsAvailable[index].name,
            description: foodsAvailable[index].description,
            lgprice: foodsAvailable[index].lgprice,
            mdprice: foodsAvailable[index].mdprice,
            smprice: foodsAvailable[index].smprice,
            imageURL: foodsAvailable[index].imageURL,
          );
        },
      ),
    );
  }
}
