// ignore_for_file: file_names, no_logic_in_create_state

import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:test/features/Cart/presentation/pages/cartScreen.dart';

import 'package:test/features/Food/presentation/widgets/added.dart';

import 'package:flutter/material.dart';

class FoodDetail extends StatelessWidget {
  final String name, description, imageURL, price;
  const FoodDetail({
    Key key,
    @required this.name,
    this.imageURL,
    @required this.price,
    @required this.description,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
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
                        Image.network(imageURL),
                        Container(),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 245,
                                horizontal: 20,
                              ),
                              child: Container(
                                width: 100,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: const BoxDecoration(
                                  color: black87,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35),
                                  ),
                                ),
                                child: Text(
                                  name,
                                  textAlign: TextAlign.center,
                                  style: themeData.textTheme.headline5.copyWith(
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
                                  width:
                                      MediaQuery.of(context).size.width * .435,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Description",
                                        textAlign: TextAlign.justify,
                                        style: themeData.textTheme.headline4
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: black,
                                        ),
                                      ),
                                      addVertical(7.5),
                                      Text(
                                        description,
                                        style: themeData.textTheme.subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.115,
                                    decoration:
                                        const BoxDecoration(color: white),
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: SizedBox(
                                        // height: double.infinity,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .45,
                                        child: added(
                                          index: index,
                                          price: price,
                                          name: name,
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
                          // itemCount: _foodsAvailable.length,
                          itemBuilder: (context, index) {
                            return Container();
                            // return FoodList(
                            //   index: index,
                            //   name: foodsAvailable[index].name,
                            //   description: foodsAvailable[index].description,
                            //   lgprice: foodsAvailable[index].lgprice,
                            //   mdprice: foodsAvailable[index].mdprice,
                            //   smprice: foodsAvailable[index].smprice,
                            //   imageURL: foodsAvailable[index].imageURL,
                            // );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Expanded(child,)
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          ),
          child: const Icon(Icons.shopping_cart, color: white),
        ),
      ),
    );
  }
}
