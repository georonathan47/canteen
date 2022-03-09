// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/landingPage.dart';

import 'core/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool proceed = false;

  @override
  void initState() {
    super.initState();

    // _navigateHome();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        proceed = true;
        _navigateHome();
        // goToHome();
        // goToHome();
      }
    });
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // ! ANIMATED LOGO
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/MAKATA.png',
              height: animation.value * 250,
            ),
            // Center(
            //   child: Text(
            //     "Harmony Life",
            //     style: GoogleFonts.quattrocento(
            //       textStyle: TextStyle(
            //         fontSize: animation.value * 20,
            //         letterSpacing: 8,
            //         fontWeight: FontWeight.w300,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
            // Divider(
            //   indent: 60,
            //   endIndent: 60,
            //   color: kGreenTextColor,
            //   thickness: 1,
            // ),
            // Center(
            //   child: Text(
            //     "MyAssembly.Gov.GH - Community",
            //     style: GoogleFonts.raleway(
            //       textStyle: const TextStyle(
            //         fontSize: 12,
            //         letterSpacing: 1,
            //         fontWeight: FontWeight.w100,
            //         color: Colors.black87,
            //         // color: Color(0xFF01B000),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
