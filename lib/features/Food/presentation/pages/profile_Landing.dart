// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/widgetFunction.dart';

class profileLanding extends StatefulWidget {
  const profileLanding({Key key}) : super(key: key);

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
            // addVertical(20),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: Expanded(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(),
                      addVertical(10),
                      TextFormField(),
                      addVertical(10),
                      TextFormField(),
                      addVertical(
                        MediaQuery.of(context).size.height * .175,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "CANCEL",
                                style: GoogleFonts.lato(
                                  textStyle: themeData.textTheme.headline6
                                      .copyWith(
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
                                  textStyle: themeData.textTheme.headline6
                                      .copyWith(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
