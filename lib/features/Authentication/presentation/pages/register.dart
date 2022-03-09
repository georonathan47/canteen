// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/constants.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:test/core/shared/loading.dart';
import 'package:test/core/shared/makata.api.dart';
import 'package:test/landingPage.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key key, this.toggleView}) : super(key: key);

  // get tokenId => AuthService();

  @override
  _RegisterState createState() => _RegisterState(toggleView);
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final MakataAPI _api = MakataAPI();

  bool loading = false;
  String error = "";
  bool isAPIcall = false;
  _RegisterState(Function toggleView);
  Map<String, dynamic> userMap;

  // @override
  // void initState() {
  //   // setID;
  //   super.initState();
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userMap;
    super.dispose();
  }

  // void setID() {
  //   for (var i; i < 2000; i++) {
  //     setState(() {
  //       i += i + 1;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Loading(
      child: uiBuild(context),
      isAsyncCall: isAPIcall,
      opacity: 0.75,
    );
  }

  Widget uiBuild(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Register Page',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 20,
                letterSpacing: 1.25,
                color: black,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(
                Icons.person_outlined,
                color: black,
              ),
              label: Text(
                'Register',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    letterSpacing: .75,
                    color: black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onPressed: () {
                widget.toggleView();
              },
            ),
          ],
        ),
        body: loading
            ? const Loading()
            : ClipRRect(
                child: Details(screenWidth),
              ),
      ),
    );
  }

  Container Details(double screenWidth) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 1,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formkey,
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.amber,
                      inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: primaryColor,
                          fontSize: 20.0,
                        ),
                      ),
                      textTheme: screenWidth < 500 ? smallScreen : largeScreen,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            "Create a new account!",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: purple,
                                letterSpacing: 1.75,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        addVertical(size.height * 0.010),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              buildTextFormField(
                                "Enter Your Username",
                                "Username",
                                nameController,
                                false,
                                true,
                                false,
                              ),
                              addVertical(size.height * 0.010),
                              buildTextFormField(
                                "Enter A valid Email address",
                                "Email",
                                emailController,
                                true,
                                false,
                                false,
                              ),
                              addVertical(size.height * 0.010),
                              buildTextFormField(
                                'Enter password',
                                'Password',
                                passwordController,
                                false,
                                false,
                                false,
                              ),
                              addVertical(size.height * 0.010),
                              buildTextFormField(
                                'Confirm password',
                                'Confirm Password',
                                confirmPasswordController,
                                false,
                                false,
                                true,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20.0),
                              ),
                              addVertical(size.height * 0.010),
                              SizedBox(
                                height: size.height * 0.07,
                                width: size.width * 0.55,
                                child: Expanded(
                                  //! Register button
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: gold,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    child: Text(
                                      'Register',
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                          fontSize: 22,
                                          letterSpacing: 2.2,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    onPressed: onButtonPressed,
                                  ),
                                ),
                              ),
                              addVertical(size.height * 0.015),
                              Text(
                                error,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.red[500],
                                    fontWeight: FontWeight.bold,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonPressed() async {
    // signIn();
    if (validateAndSave()) {
      setState(() {
        isAPIcall = true;
      });
      var userMap = {
        "id": null,
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirm_password": confirmPasswordController.text,
        "role": false,
      };
      var authority = "ktu-restaurant.bkayphotosgh.com";
      var response = await _api.authData(userMap, "$authority/api/register");
      var boddy = json.decode(response.body);
      if (boddy['message'] == "Success") {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(boddy['token']));
        localStorage.setString('name', json.encode(boddy['name']));
      }

      setState(() {
        isAPIcall = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Landing(),
          ),
        );
      });
    }
  }

  bool validateAndSave() {
    final form = _formkey.currentState;
    if (form.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        form.save();
      }
      return true;
    } else {
      return false;
    }
  }

  TextFormField buildTextFormField(
      String hint,
      label,
      TextEditingController controller,
      bool isEmail,
      bool isUser,
      bool confirm) {
    return TextFormField(
      validator: (val) => val.isEmpty &&
              val !=
                  RegExp("a-zA-Z0-9." "@a-z" ".a-z")
                      .hasMatch(emailController.text)
          ? ""
          : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        labelText: label,
        labelStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        border: InputBorder.none,
        prefixIcon: isEmail
            ? const Icon(Icons.mail_outline_rounded)
            : const Icon(Icons.lock),
        fillColor: Colors.purple,
        filled: true,
        focusColor: lightGold,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Color(0x00008baa),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Color(0x00008baa),
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: isEmail
          ? (val) {
              emailController.text = val;
            }
          : (isUser
              ? (val) {
                  nameController.text = val;
                }
              : (!confirm
                  ? (val) {
                      passwordController.text = val;
                    }
                  : (val) {
                      confirmPasswordController.text = val;
                    })),
      // onSaved: (input) => isEmail
      //     ? userMap['email'] = input
      //     : (isUser ? userMap['name'] = input : userMap['password'] = input),
      obscureText: !isEmail && !isUser ? true : false,
    );
  }
}
