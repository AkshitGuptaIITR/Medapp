import 'package:flutter/material.dart';
import 'package:medapp/Screen/ClinicProfileScreen.dart';
import 'package:medapp/Screen/ClinicScreen.dart';
import 'package:medapp/Screen/FAQScreen.dart';
import 'package:medapp/Screen/MainScreen.dart';
import 'package:medapp/Screen/LoginScreen.dart';
import 'package:medapp/Screen/MyPatientScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAEAppointmentDate.dart';
import 'package:medapp/Screen/OAEScreens/OAECountScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAEHospitalScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAELastResultScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAELastScreeningScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAEReminderScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAEScheduleScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAEScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAECityScreen.dart';
import 'package:medapp/Screen/OAEScreens/OAESuccessScreen.dart';
import 'package:medapp/Screen/RegisterScreen.dart';
import 'package:medapp/Screen/Tips/TipsScreen.dart';

final Map<String, WidgetBuilder> routes = {
  "/login": (context) => LoginScreen(),
  "/": (context) => MainScreen(),
  "/register": (context) => RegisterScreen(),
  "/oae": (context) => OAEScreen(),
  "/oaeCount": (context) => OAECountScreen(),
  "/oaeLastResult": (context) => OAELastResultScreen(),
  "/oaeLastScreening": (context) => OAELastScreeningScreen(),
  "/oaeSchedule": (context) => OAEScheduleScreen(),
  "/oaeCity": (context) => OAECityScreen(),
  "/oaeHospital": (context) => OAEHospitalScreen(),
  "/oaeAppointment": (context) => OAEAppointmentDate(),
  "/oaeReminder": (context) => OAEReminderScreen(),
  "/oaeSuccess": (context) => OAESuccessScreen(),
  "/clinics": (context) => ClinicScreen(),
  "/tips": (context) => TipsScreen(),
  "/faq": (context) => FAQScreen(),
  "/clinicProfile": (context) => ClinicProfileScreen(),
  "/myPatient": (context) => MyPatientScreen()
};
