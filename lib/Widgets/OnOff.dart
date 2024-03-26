import 'package:flutter/material.dart';

class OnOff extends StatelessWidget {
  const OnOff({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71.30,
      height: 32.76,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 71.30,
              height: 32.76,
              decoration: ShapeDecoration(
                color: Color(0xFF0DA59B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 5.78,
            top: 4.82,
            child: Container(
              width: 30.83,
              height: 23.12,
              decoration: ShapeDecoration(
                color: Color(0xFFCFEFEC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 7.71,
            child: SizedBox(
              width: 11.56,
              height: 18.31,
              child: Text(
                'on',
                style: TextStyle(
                  color: Color(0xFF282828),
                  fontSize: 16,
                  fontFamily: 'Kamerik 105 Cyrillic',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 42,
            top: 6,
            child: SizedBox(
              child: Text(
                'off',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Kamerik 105 Cyrillic',
                  fontWeight: FontWeight.w100,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
