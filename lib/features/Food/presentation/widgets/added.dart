// ignore_for_file: camel_case_types, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:test/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:test/features/Cart/data/datasources/cartController.dart';
class added extends StatelessWidget {
  const added({
    Key key,
    @required this.name,
    @required this.price,
    this.index,
  }) : super(key: key);
  final String name, price;
  final int index;
  CartController get controller => Get.put(CartController(index: index));

  // int get newIndex => index;

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
                "Price GH₵:",
                style: themeData.textTheme.subtitle1.copyWith(
                  color: black,
                  letterSpacing: 0.75,
                  fontWeight: FontWeight.bold,
                  // fontSize: 13,
                ),
              ),
            ),
            // addVertical(10),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "GH¢: $price",
                  style: themeData.textTheme.subtitle1.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // controller.addProduct(Food.foodsAvailable[index]);
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
