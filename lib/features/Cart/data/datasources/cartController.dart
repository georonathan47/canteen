import 'package:get/get.dart';
import 'package:test/features/Food/data/models/foodModel.dart';

class CartController extends GetxController {
  int get index => Food.foodsAvailable[index] as int;
  final _foods = {}.obs;

  void addProduct(Food product) {
    if (_foods.containsKey(product)) {
      // _foods[product] += 1;
      // if (_foods.containsKey(Food.foodsAvailable[index].lgprice)) {
      _foods[product] += 1;
      // lgPrice;
      // // } else if (_foods.containsKey(Food.foodsAvailable[index].mdprice)) {
      // _foods[product] += 1;
      // mdPrice;
      // // } else {
      // _foods[product] += 1;
      // smPrice;
      // }
    } else {
      _foods[product] = 1;
    }

    Get.snackbar(
      "Food added to cart",
      "Your ${product.name} has been added to the cart!",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1500),
    );
  }

  void removeProduct(Food product) {
    if (_foods.containsKey(product) && _foods[product] == 1) {
      _foods.removeWhere((key, value) => key == product);
    } else {
      _foods[product] -= 1;
    }

    Get.snackbar(
      "Food removed from cart",
      "Your ${product.name} has been removed from the cart!",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1000),
    );
  }

  get mdPrice => _foods.entries
      .map((product) => (product.key.mdprice) * product.value)
      .toList();

  get lgPrice => _foods.entries
      .map((product) => (product.key.mdprice) * product.value)
      .toList();

  get smPrice => _foods.entries
      .map((product) => (product.key.smprice) * product.value)
      .toList();
  get products => _foods;

  get productSubtotal => _foods.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _foods.entries
      .map((product) =>
          ((product.key.deliveryPrice) + (product.key.mdprice)) * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
