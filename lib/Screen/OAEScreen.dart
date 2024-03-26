import 'package:flutter/material.dart';

class OAEScreen extends StatefulWidget {
  const OAEScreen({super.key});

  @override
  State<OAEScreen> createState() => _OAEScreenState();
}

class _OAEScreenState extends State<OAEScreen> {
  Future<void> handleOAEYes() async {}

  Future<void> handleOAENo() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  size: 36,
                  color: Color(0xFF11ADA2),
                ),
                Spacer(),
                Icon(
                  Icons.close,
                  size: 36,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 102, left: 24, right: 24),
            child: Text(
              "Was OAE screening test done?",
              style: TextStyle(
                color: Color(0xFF323F4B),
                fontSize: 46,
                fontFamily: 'Kamerik 105 Cyrillic',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 72),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                GestureDetector(
                  onTap: handleOAEYes,
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
                  onTap: handleOAENo,
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
          ),
          // Spacer(),
          Container(
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
                          left: 12,
                          top: 16,
                          child: SizedBox(
                            width: 9.42,
                            height: 20.19,
                            child: Text(
                              '1',
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
                          left: 12,
                          top: 16,
                          child: SizedBox(
                            width: 9.42,
                            height: 20.19,
                            child: Text(
                              '2',
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
                          left: 12,
                          top: 16,
                          child: SizedBox(
                            width: 9.42,
                            height: 20.19,
                            child: Text(
                              '3',
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
                          left: 12,
                          top: 16,
                          child: SizedBox(
                            width: 9.42,
                            height: 20.19,
                            child: Text(
                              '4',
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
    );
  }
}
