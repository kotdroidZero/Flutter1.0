import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.dark,
      accentColor: Colors.red);
}

ThemeData lightTheme() {
  return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      accentColor: Colors.red);
}

bool isValidEmail(String email) {
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(email);
}


void showSnackBar(BuildContext context, String message, String actionNme) {
  var snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: actionNme,
      onPressed: () {},
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
