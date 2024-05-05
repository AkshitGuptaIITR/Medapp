import 'package:flutter/material.dart';
import 'package:medapp/utils/Colors.dart';

class OAEAppointmentDate extends StatefulWidget {
  const OAEAppointmentDate({super.key});

  @override
  State<OAEAppointmentDate> createState() => _OAEAppointmentDateState();
}

class _OAEAppointmentDateState extends State<OAEAppointmentDate> {
  dynamic id, city, hospitalName;
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 1));

  void onDateSelected(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
    Navigator.pushNamed(context, "/oaeSchedule");
    print("Selected date: $newDate");
  }

  Future<void> handlePassClick() async {
    Navigator.pushNamed(context, "/oaeCount", arguments: id);
  }

  Future<void> handleReferClick() async {}

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      id = arguments['id'];
      city = arguments['city'];
      hospitalName = arguments['hospital_name'];
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Hospital",
                    style: TextStyle(
                      color: Color(0xFF323F4B),
                      fontSize: 40,
                      // fontFamily: 'Kamerik 105 Cyrillic',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("City: $city",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF323F4B),
                          fontWeight: FontWeight.w900)),
                  Text("Hospital: $hospitalName",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF323F4B),
                          fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    child: CalendarDatePicker(
                      initialDate: selectedDate,
                      firstDate: DateTime.now().subtract(Duration(days: 1)),
                      lastDate: DateTime(2100),
                      onDateChanged: onDateSelected,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
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
                            left: 12,
                            top: 16,
                            child: SizedBox(
                              width: 9.42,
                              height: 20.19,
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: Color(0xFF11ADA2),
                                  fontSize: 20,
                                  fontFamily: 'Kamerik 105 Cyrillic',
                                  fontWeight: FontWeight.w700,
                                  height: 0.05,
                                  letterSpacing: 1.25,
                                ),
                              ),
                            ),
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
