// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/features/Cart/presentation/widgets/cartTotal.dart';

import '../widgets/cartProducts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key,}) : super(key: key);
    // final String image;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CartProducts(),
            const Expanded(child: CartTotal()),
          ],
        ),
      ),
    );
  }
}
