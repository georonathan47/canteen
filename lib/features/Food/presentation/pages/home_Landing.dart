// ignore_for_file: file_names, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:test/core/shared/makata.api.dart';
import 'package:test/features/Food/data/models/foodModel.dart';
import 'package:test/features/Food/presentation/widgets/foodCard.dart';

class homeLanding extends StatefulWidget {
  const homeLanding({Key key}) : super(key: key);

  @override
  _homeLandingState createState() => _homeLandingState();
}

class _homeLandingState extends State<homeLanding> {
  List _foodsAvailable = [];
  Future<Food> futureFood;
  bool loading = false;
  final MakataAPI _api = MakataAPI();

  @override
  void initState() {
    super.initState();
    futureFood = getFood();
  }

  @override
  void dispose() {
    futureFood;
    super.dispose();
  }

  Future<Food> getFood() async {
    final response =
        await http.get(Uri.parse("https://ktuapi.bsmtsports.com/api/food"));
    final info = await json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        loading = true;
        _foodsAvailable = info["data"];
      });
      print(_foodsAvailable);
      return Food.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Unable to load Menu for the Day!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: lightGold,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            child: FutureBuilder(
              future: getFood(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemCount: snapshot.data.dataa.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetail(
                                name: snapshot.data.dataa[index].foodName,
                                imageURL: snapshot.data.dataa[index].image,
                                price: snapshot.data.dataa[index].price,
                                description:
                                    snapshot.data.dataa[index].description,
                                index: index),
                          ),
                        ),
                        child: Card(
                          color: Colors.transparent,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                children: [
                                  !loading
                                      ? Center(
                                          child: Image.network(snapshot
                                              ?.data?.dataa[index].image),
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator
                                              .adaptive(),
                                        ),
                                  addVertical(
                                      MediaQuery.of(context).size.height *
                                          0.13),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          snapshot?.data?.dataa[index].foodName,
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: gold,
                                              letterSpacing: 1.75,
                                            ),
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
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045),
                  );
                }
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator.adaptive(),
                      Text("Fetching data... \n\t\tPlease wait.")
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
