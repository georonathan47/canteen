// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test/features/Authentication/presentation/pages/login.dart';
import 'package:test/landingPage.dart';

import 'core/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Landing(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: white),
      child: Center(
        child: Image.asset(
          "assets/images/MAKATA.png",
          width: MediaQuery.of(context).size.width,
          // scale: 2.0,
        ),
      ),
    );
  }
}
