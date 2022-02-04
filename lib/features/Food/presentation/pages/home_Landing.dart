// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/features/Food/data/repositories/foodsAvailable.dart';
import 'package:test/features/Food/presentation/widgets/foodList.dart';

class homeLanding extends StatefulWidget {
  const homeLanding({Key? key}) : super(key: key);

  @override
  _homeLandingState createState() => _homeLandingState();
}

class _homeLandingState extends State<homeLanding> {
  @override
  Widget build(BuildContext context) {
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
            index: index,
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
