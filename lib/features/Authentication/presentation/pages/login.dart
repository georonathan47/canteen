import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/constants.dart';
import 'package:test/core/constants/widgetFunction.dart';
import 'package:test/core/shared/loading.dart';
import 'package:test/core/shared/makata.api.dart';
import 'package:test/features/Authentication/data/models/authenticationModel.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  const Login({Key key, this.toggleView}) : super(key: key);

  // get tokenId => AuthService();

  @override
  _LoginState createState() => _LoginState(toggleView);
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;
  String error = "";
  bool isAPIcall = false;
  _LoginState(Function toggleView);
  AuthRequest authRequest;

  @override
  void initState() {
    super.initState();
    authRequest = AuthRequest();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
          backgroundColor: Colors.cyan,
          title: Text(
            'Login Page',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 20,
                letterSpacing: 1.25,
                color: white,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(
                Icons.person_outlined,
                color: white,
              ),
              label: Text(
                'Register',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    letterSpacing: .75,
                    color: white,
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
                child: Container(
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
                                  primarySwatch: Colors.cyan,
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                    labelStyle: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textTheme: screenWidth < 500
                                      ? smallScreen
                                      : largeScreen,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Login into your account!",
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.cyan,
                                          letterSpacing: 1.75,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    addVertical(10),
                                    Container(
                                      padding: const EdgeInsets.all(50.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          buildTextFormField(
                                            "Enter A valid Email address",
                                            "Email",
                                            emailController,
                                            true,
                                          ),
                                          addVertical(10),
                                          buildTextFormField(
                                            'Enter password',
                                            'Password',
                                            passwordController,
                                            false,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 20.0),
                                          ),
                                          addVertical(10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //! Signup button
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Register',
                                                  style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                      letterSpacing: 2.2,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  widget.toggleView();
                                                },
                                              ),
                                              //! Login button
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Login',
                                                  style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                      letterSpacing: 2.2,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  // signIn();
                                                  if (validateAndSave()) {
                                                    setState(() {
                                                      isAPIcall = true;
                                                    });

                                                    MakataAPI makataAPI =
                                                        MakataAPI();
                                                    makataAPI
                                                        .login(authRequest)
                                                        .then((value) => {
                                                              setState(() {
                                                                isAPIcall =
                                                                    false;
                                                              })
                                                            });
                                                    print(authRequest.toJson());
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                          addVertical(15),
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
                ),
              ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  TextFormField buildTextFormField(
      String hint,
      label,
      TextEditingController controller,
      // Function onChanged,
      bool isEmail) {
    return TextFormField(
      validator: (val) => val.isEmpty &&
              val !=
                  RegExp("a-zA-Z0-9\." "\@a-z" "\.a-z")
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
        prefixIcon: const Icon(Icons.mail_outline_rounded),
        fillColor: Colors.cyanAccent,
        filled: true,
        focusColor: const Color(0x00008baa),
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
          : (val) {
              passwordController.text = val;
            },
      onSaved: (input) =>
          isEmail ? authRequest.email = input : authRequest.password = input,
      obscureText: !isEmail ? true : false,
    );
  }
}
