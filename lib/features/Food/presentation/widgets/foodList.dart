// ignore_for_file: file_names


import 'package:test/core/constants/widgetFunction.dart';
import 'package:flutter/material.dart';

import 'foodCard.dart';

class FoodList extends StatefulWidget {
  const FoodList({
    Key key,
    @required this.name,
    @required this.description,
    @required this.mdprice,
    @required this.smprice,
    @required this.lgprice,
    @required this.imageURL,
    @required this.index,
  }) : super(key: key);

  final String name, description, imageURL;
  final double lgprice, mdprice, smprice;
  final int index;

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetail(
              index: widget.index,
              name: widget.name,
              description: widget.description,
              imageURL: widget.imageURL,
              smprice: widget.smprice,
              mdprice: widget.mdprice,
              lgprice: widget.lgprice,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageURL),
                    maxRadius: 30,
                  ),
                  addHorizontal(20),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Text(
                                "GH¢: ${widget.lgprice}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          addVertical(10),
                          Text(
                            widget.description,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
