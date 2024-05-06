import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medapp/Widgets/Language.dart';
import 'package:medapp/Widgets/OnOff.dart';
import 'package:medapp/utils/Colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // Change the color of the status bar
        statusBarColor: primaryColor,
        // Change the color of the navigation bar (Android only)
        systemNavigationBarColor: primaryColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 180,
            title: Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    margin: EdgeInsets.only(left: 6, bottom: 24),
                    decoration: ShapeDecoration(
                      color: Color(0xFF007F77),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Text(
                    "SETTINGS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Kamerik 105 Cyrillic',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  )
                ],
              ),
              Spacer(),
              Container(
                child: Image.asset('assets/images/settings.png'),
              )
            ]),
            backgroundColor: Color(0xFF11ADA2),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(children: [
              Container(
                  height: 57,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDADADA)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 36, right: 12),
                    child: Row(children: [
                      Container(
                          width: 36,
                          height: 36,
                          margin: EdgeInsets.only(right: 16),
                          decoration: ShapeDecoration(
                            color: Color(0xFF11ADA2),
                            shape: OvalBorder(),
                          ),
                          child: Icon(
                            Icons.language_sharp,
                            color: Colors.white,
                          )),
                      Text(
                        "Language",
                        style: TextStyle(
                          color: Color(0xFF323232),
                          fontSize: 20,
                          fontFamily: 'Kamerik 105 Cyrillic',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Spacer(),
                      Language()
                    ]),
                  )),
              Container(
                  height: 57,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDADADA)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 36, right: 12),
                    child: Row(children: [
                      Container(
                          width: 36,
                          height: 36,
                          margin: EdgeInsets.only(right: 16),
                          decoration: ShapeDecoration(
                            color: Color(0xFF11ADA2),
                            shape: OvalBorder(),
                          ),
                          child: Icon(
                            Icons.volume_up_outlined,
                            color: Colors.white,
                          )),
                      Text(
                        "Voice Reminder",
                        style: TextStyle(
                          color: Color(0xFF323232),
                          fontSize: 20,
                          fontFamily: 'Kamerik 105 Cyrillic',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                      Spacer(),
                      OnOff()
                    ]),
                  )),
              Container(
                  height: 57,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDADADA)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 36, right: 12),
                    child: Row(children: [
                      Container(
                          width: 36,
                          height: 36,
                          margin: EdgeInsets.only(right: 16),
                          decoration: ShapeDecoration(
                            color: Color(0xFF11ADA2),
                            shape: OvalBorder(),
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          )),
                      Text(
                        "Reminder Method",
                        style: TextStyle(
                          color: Color(0xFF323232),
                          fontSize: 20,
                          fontFamily: 'Kamerik 105 Cyrillic',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ]),
                  )),
              Container(
                  height: 57,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDADADA)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 36, right: 12),
                    child: Row(children: [
                      Container(
                          width: 36,
                          height: 36,
                          margin: EdgeInsets.only(right: 16),
                          decoration: ShapeDecoration(
                            color: Color(0xFF11ADA2),
                            shape: OvalBorder(),
                          ),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          )),
                      Text(
                        "Update Profile",
                        style: TextStyle(
                          color: Color(0xFF323232),
                          fontSize: 20,
                          fontFamily: 'Kamerik 105 Cyrillic',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ]),
                  )),
              Container(
                  height: 57,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDADADA)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 36, right: 12),
                    child: Row(children: [
                      Container(
                          width: 36,
                          height: 36,
                          margin: EdgeInsets.only(right: 16),
                          decoration: ShapeDecoration(
                            color: Color(0xFF11ADA2),
                            shape: OvalBorder(),
                          ),
                          child: Icon(
                            Icons.support_agent,
                            color: Colors.white,
                          )),
                      Text(
                        "Contact Support",
                        style: TextStyle(
                          color: Color(0xFF323232),
                          fontSize: 20,
                          fontFamily: 'Kamerik 105 Cyrillic',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ]),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
