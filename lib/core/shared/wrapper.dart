import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/core/services/authenticate.dart';
import 'package:test/landingPage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = Provider.of<Human>(context);
    if (client == null) {
      return const Authenticate();
      //Homepage();
    } else {
      print(client);
      return const Landing();
    }
  }
}

class Human {
  final String uid;

  Human({this.uid});
}
