import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/features/Food/data/models/foodModel.dart';

class CartController extends GetxController {
  final int index;

  CartController({@required this.index});
  // bool get isLarge => _foodsAvailable[index].mdprice as bool;
  // bool get isMedium => _foodsAvailable[index].mdprice as bool;
  final _foods = {}.obs;

  void addProduct(FoodDetails product) {
    if (_foods.containsKey(product)) {
      _foods[product] += 1;
    } else {
      _foods[product] = 1;
    }

    Get.snackbar(
      "Food added to cart",
      "Your ${product.foodName} has been added to the cart!",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1500),
    );
  }

  void removeProduct(FoodDetails product) {
    if (_foods.containsKey(product) && _foods[product] == 1) {
      _foods.removeWhere((key, value) => key == product);
    } else {
      _foods[product] -= 1;
    }

    Get.snackbar(
      "Food removed from cart",
      "Your ${product.foodName} has been removed from the cart!",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1000),
    );
  }

  get mdPrice => _foods.entries
      .map((product) => (product.key.mdprice) * product.value)
      .toList();

  get lgPrice => _foods.entries
      .map((product) => (product.key.lgprice) * product.value)
      .toList();

  get smPrice => _foods.entries
      .map((product) => (product.key.smprice) * product.value)
      .toList();

  get products => _foods;

  get productSubtotal => _foods.entries
      .map(((product) => product.key.smprice * product.value))
      .toList();

  get total => _foods.entries
      .map((product) => (((product.key.deliveryPrice) + (product.key.mdprice)) *
          product.value))
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
