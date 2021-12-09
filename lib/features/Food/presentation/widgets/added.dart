// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:flutter/material.dart';

class added extends StatefulWidget {
  const added({
    Key? key,
    required this.name,
    required this.lgprice,
    required this.mdprice,
    required this.smprice,
  }) : super(key: key);
  final String name;
  final double lgprice, mdprice, smprice;
  @override
  addedState createState() => addedState();
}

class addedState extends State<added> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    "Size",
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.subtitle1!.copyWith(
                      color: black,
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Price",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: black,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            addVertical(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Large",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "GH¢: ${widget.lgprice}",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            addVertical(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Medium",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "GH¢: ${widget.mdprice}",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            addVertical(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Small",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "GH¢: ${widget.smprice}",
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.lime,
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
