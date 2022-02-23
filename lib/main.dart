// @dart = 2.7

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test/splashScreen.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColorBrightness: Brightness.light,
      ),
      home: const SplashScreen(),
    );
  }
}
