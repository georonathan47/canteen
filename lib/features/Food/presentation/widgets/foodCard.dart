// ignore_for_file: file_names, no_logic_in_create_state

import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:test/features/Food/data/models/foodModel.dart';
// import 'package:test/features/Food/presentation/widgets/addToCart.dart';
import 'package:test/features/Food/presentation/widgets/added.dart';
import 'package:test/features/Food/presentation/widgets/foodList.dart';
import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  final String name, description, imageURL;
  final double smprice, mdprice, lgprice;
  const FoodDetail({
    Key? key,
    required this.name,
    required this.imageURL,
    required this.smprice,
    required this.mdprice,
    required this.lgprice,
    required this.description,
  }) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState(
        name,
        smprice,
        mdprice,
        lgprice,
        description,
        imageURL,
      );
}

class _FoodDetailState extends State<FoodDetail> {
  _FoodDetailState(
    name,
    smprice,
    mdprice,
    lgprice,
    description,
    imageURL,
  );

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
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            // color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(color: Colors.lime),
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.5),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Stack(
                      children: [
                        Image.network(widget.imageURL),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 245,
                                horizontal: 20,
                              ),
                              child: Container(
                                width: 100,
                                height: MediaQuery.of(context).size.height * 0.05,
                                decoration: const BoxDecoration(
                                  color: black87,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35),
                                  ),
                                ),
                                child: Text(
                                  widget.name,
                                  textAlign: TextAlign.center,
                                  style: themeData.textTheme.headline5!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.5,
                            vertical: 20,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .435,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Description",
                                        textAlign: TextAlign.left,
                                        style: themeData.textTheme.headline4!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: black,
                                        ),
                                      ),
                                      addVertical(7.5),
                                      Text(
                                        widget.description,
                                        style: themeData.textTheme.subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.115,
                                    decoration: const BoxDecoration(color: white),
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            .45,
                                        child: added(
                                          lgprice: widget.lgprice,
                                          name: widget.name,
                                          smprice: widget.smprice,
                                          mdprice: widget.mdprice,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVertical(2.5),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 7.5,
                        ),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _cartItems(),
          child: const Icon(Icons.shopping_cart, color: white),
        ),
      ),
    );
  }

  void _cartItems() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
            child: Column(
              children: const [
                // Selected items
                Text("Selected items"),
              ],
            ),
          );
        });
  }
}
