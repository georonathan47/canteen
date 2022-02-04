// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:test/features/Food/data/models/food.api.dart';
import 'package:test/features/Food/data/models/foodModel.dart';
import 'package:test/features/Food/presentation/widgets/foodList.dart';

class homeLanding extends StatefulWidget {
  const homeLanding({Key key}) : super(key: key);

  @override
  _homeLandingState createState() => _homeLandingState();
}

class _homeLandingState extends State<homeLanding> {
  List<Food> _foodsAvailable = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getFoods();
  }

  Future<void> getFoods() async {
    _foodsAvailable = await FoodAPI.getFoods();
    setState(() {
      loading = false;
    });
    print(_foodsAvailable);
  }

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
      child: loading
          ? Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              // alignment: Alignment.bottomCenter,
              child: Column(
                children:  [
                  addVertical(MediaQuery.of(context).size.height * .35),
                  const CircularProgressIndicator.adaptive(),
                  addVertical(20),
                  const Text(
                      "Fetching data from API... \n \t\t\t\t\t\t\t\t\tPlease wait...")
                ],
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _foodsAvailable.length,
              itemBuilder: (context, index) {
                return Card(
                  child: FoodList(
                    index: index,
                    name: _foodsAvailable[index].food_name,
                    description: _foodsAvailable[index].description,
                    lgprice: _foodsAvailable[index].lgprice,
                    mdprice: _foodsAvailable[index].mdprice,
                    smprice: _foodsAvailable[index].smprice,
                    imageURL: _foodsAvailable[index].imageURL,
                  ),
                );
              },
            ),
    );
  }
}
