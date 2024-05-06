import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:medapp/utils/Api.dart';
import 'package:medapp/utils/Colors.dart';

class OAEReminderScreen extends StatefulWidget {
  const OAEReminderScreen({super.key});

  @override
  State<OAEReminderScreen> createState() => _OAEReminderScreenState();
}

class _OAEReminderScreenState extends State<OAEReminderScreen> {
  dynamic id, city, hospitalName, selectedDate, appointmentId;

  Future<void> handleYesClick() async {
    try {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: "token");

      final response = await Api.put(
          "/appointment/" + appointmentId,
          {
            'reminder': true,
          },
          token);

      if (response["statusCode"] >= 400) {
        print(response["body"]["message"]);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response["body"]["message"]),
          backgroundColor: Colors.red,
        ));
        return;
      }

      Fluttertoast.showToast(
          msg: "Reminder set for the appointment",
          backgroundColor: Colors.white,
          gravity: ToastGravity.TOP,
          fontSize: 16,
          textColor: primaryColor);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: primaryColor,
            title: Text(
              'Important Information for parents',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            content: Container(
              width: 250,
              height: 300,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.top,
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Icon(Icons.circle, size: 8, color: Colors.white),
                    ),
                    horizontalTitleGap: 0,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    dense: true,
                    title: Text(
                      "Clean your child before the OAE screening.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.top,
                    dense: true,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Icon(Icons.circle, size: 8, color: Colors.white),
                    ),
                    title: Text(
                      "The OAE screening happens when the child is in sleep, so the night before the test, make sure your child sleeps late and wake up early.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Container(
                alignment: Alignment.center,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/oaeSuccess");
                  },
                  style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 28),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(50))),
                  child: Text('Proceed',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
              ),
            ],
          );
        },
      );
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> handleNoClick() async {
    Navigator.pushReplacementNamed(context, "/oaeSuccess");
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      id = arguments['id'];
      city = arguments['city'];
      hospitalName = arguments['hospital_name'];
      selectedDate =
          DateFormat("dd-MM-yyyy").format(DateTime.parse(arguments['date']));
      appointmentId = arguments['appointment_id'];
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 64, left: 24, right: 24),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Text(
                  "Appointment for OAE screening sucessfully scheduled for $selectedDate at $hospitalName, $city",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 82, left: 24, right: 24),
              child: Text(
                "Set reminder for your appointment?",
                style: TextStyle(
                  color: Color(0xFF323F4B),
                  fontSize: 40,
                  fontFamily: 'Kamerik 105 Cyrillic',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                GestureDetector(
                  onTap: handleYesClick,
                  child: Container(
                    width: 96,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFF11ADA2)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'YES',
                      style: TextStyle(
                        color: Color(0xFF11ADA2),
                        fontSize: 24,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: handleNoClick,
                  child: Container(
                    width: 96,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFF11ADA2)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'NO',
                      style: TextStyle(
                        color: Color(0xFF11ADA2),
                        fontSize: 24,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            // Spacer(),
            Container(
              margin: EdgeInsets.only(top: 72),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(color: Color(0xFF11ADA2)),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.18,
                    top: 45,
                    child: Container(
                      width: 246,
                      height: 10,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.10,
                    top: 32,
                    child: Container(
                      width: 35,
                      height: 35,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 6,
                            child: Icon(Icons.done,
                                color: primaryColor, opticalSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.26,
                    top: 32,
                    child: Container(
                      width: 35,
                      height: 35,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 6,
                            child: Icon(Icons.done,
                                color: primaryColor, opticalSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.44,
                    top: 32,
                    child: Container(
                      width: 35,
                      height: 35,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 6,
                            child: Icon(Icons.done,
                                color: primaryColor, opticalSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.60,
                    top: 32,
                    child: Container(
                      width: 35,
                      height: 35,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 6,
                            child: Icon(Icons.done,
                                color: primaryColor, opticalSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.76,
                    top: 32,
                    child: Container(
                      width: 35,
                      height: 35,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 6,
                            child: Icon(Icons.done,
                                color: primaryColor, opticalSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
