// ignore_for_file: file_names, camel_case_types

import 'package:test/features/Food/data/models/foodModel.dart';
import 'package:flutter/material.dart';

import 'added.dart';

class addToCart extends StatelessWidget {
  const addToCart({
    Key key,
    @required this.name,
    @required this.lgprice,
    @required this.mdprice,
    @required this.smprice,
  }) : super(key: key);
  final String name;
  final double lgprice, mdprice, smprice;

  @override
  Widget build(BuildContext context) {
    List<Food> foods = [];
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return added(
          index: index,
          name: foods[index].dataa[index].foodName,
          price: foods[index].dataa[index].price,
        );
      },
    );
  }
}
