// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
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
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getFood();
  }

  Future<void> getFood() async {
    _foodsAvailable = await fetchFoods();
    setState(() {
      loading = true;
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        child: Container(
          child: FutureBuilder(
            future: fetchFoods(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Food food = snapshot.data[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Colors.transparent,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              children: [
                                !loading
                                    ? Image.network(food.image)
                                    : const Center(
                                        child:
                                            CircularProgressIndicator.adaptive(),
                                      ),
                                addVertical(
                                    MediaQuery.of(context).size.height * 0.13),
                                Expanded(
                                  child: Text(food.foodName),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045),
                );
              }
              return const Center(child: CircularProgressIndicator.adaptive());
            },
          ),
        ),
      ),
    );
  }
}
