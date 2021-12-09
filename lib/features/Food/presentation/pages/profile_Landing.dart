// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/widgetFunction.dart';

class profileLanding extends StatefulWidget {
  const profileLanding({Key? key}) : super(key: key);

  @override
  _profileLandingState createState() => _profileLandingState();
}

class _profileLandingState extends State<profileLanding> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 45.0,
                    // bottom: 45.0,
                    left: 35,
                    right: 35,
                  ),
                  child: Form(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(),
                          // addVertical(25),
                          TextFormField(),
                          // addVertical(25),
                          TextFormField(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            addVertical(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "CANCEL",
                      style: GoogleFonts.lato(
                        textStyle: themeData.textTheme.headline6!.copyWith(
                          letterSpacing: 0.75,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "SAVE",
                      style: GoogleFonts.lato(
                        textStyle: themeData.textTheme.headline6!.copyWith(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
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
