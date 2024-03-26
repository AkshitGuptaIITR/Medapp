import 'package:flutter/material.dart';
import 'package:medapp/Screen/MainScreen.dart';
import 'package:medapp/Screen/LoginScreen.dart';
import 'package:medapp/Screen/OAEScreen.dart';
import 'package:medapp/Screen/RegisterScreen.dart';

final Map<String, WidgetBuilder> routes = {
  "/login": (context) => LoginScreen(),
  "/": (context) => MainScreen(),
  "/register": (context) => RegisterScreen(),
  "/oae": (context) => OAEScreen()
};
