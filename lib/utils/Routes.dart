import 'package:flutter/material.dart';
import 'package:medapp/Screen/MainScreen.dart';
import 'package:medapp/Screen/LoginScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAECountScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAELastResultScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAELastScreeningScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAEScheduleScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAEScreen.dart';
import 'package:medapp/Screen/RegisterScreen.dart';

final Map<String, WidgetBuilder> routes = {
  "/login": (context) => LoginScreen(),
  "/": (context) => MainScreen(),
  "/register": (context) => RegisterScreen(),
  "/oae": (context) => OAEScreen(),
  "/oaeCount": (context) => OAECountScreen(),
  "/oaeLastResult": (context) => OAELastResultScreen(),
  "/oaeLastScreening": (context) => OAELastScreeningScreen(),
  "/oaeSchedule": (context) => OAEScheduleScreen(),
};
