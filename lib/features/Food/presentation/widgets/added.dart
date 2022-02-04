// ignore_for_file: camel_case_types, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:flutter/material.dart';
import 'package:test/features/Cart/data/datasources/cartController.dart';
import 'package:test/features/Food/data/models/foodModel.dart';
import 'package:test/features/Food/data/repositories/foodsAvailable.dart';

class added extends StatelessWidget {
  added({
    Key? key,
    required this.name,
    required this.lgprice,
    required this.mdprice,
    required this.smprice,
    required this.index,
  }) : super(key: key);
  final String name;
  final double lgprice, mdprice, smprice;
//   @override
//   addedState createState() => addedState();
// }

// class addedState extends State<added> {
  final int index;
  final controller = Get.put(CartController());

  // get index => null;

  // Food get product => controller.products;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Cataloge(themeData, context);
  }

  Container Cataloge(ThemeData themeData, BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Prices GH₵:",
                style: themeData.textTheme.subtitle1!.copyWith(
                  color: black,
                  letterSpacing: 0.75,
                  fontWeight: FontWeight.bold,
                  // fontSize: 13,
                ),
              ),
            ),
            // addVertical(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "GH¢: $lgprice",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    controller.addProduct(Food.foodsAvailable[index]);
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            // addVertical(MediaQuery.of(context).size.height * 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "GH¢: $mdprice",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    controller.addProduct(Food.foodsAvailable[index]);
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            addVertical(MediaQuery.of(context).size.height * 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "GH¢: $smprice",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    controller.addProduct(Food.foodsAvailable[index]);
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
