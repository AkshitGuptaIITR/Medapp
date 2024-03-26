import 'package:flutter/material.dart';
import 'package:medapp/utils/Colors.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({
    super.key,
    required this.idx,
    required this.callback,
  });

  final int idx;
  final Function(int) callback;

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  final List<Map<String, dynamic>> bottomItems = [
    {
      "icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "icon": Icons.calendar_month_outlined,
      "label": "Calendar",
    },
    {
      "icon": Icons.people_alt_outlined,
      "label": "Patients",
    },
    {
      "icon": Icons.settings_outlined,
      "label": "Settings",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 12, color: Colors.grey)]),
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: bottomItems.length,
            itemBuilder: (context, index) => Container(
              child: GestureDetector(
                onTap: () => widget.callback(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: widget.idx == index
                              ? Color(0xFF079A90)
                              : Colors.white,
                        ),
                        child: Icon(
                          bottomItems[index]
                              ["icon"], // Use the icon from your data
                          color: widget.idx == index
                              ? Colors.white
                              : Color(0xFF7B7B7B),
                          size: 28,
                        ),
                      ),
                      Text(
                        bottomItems[index]
                            ["label"], // Use the label from your data
                        style: TextStyle(
                          color: widget.idx == index
                              ? Color(0xFF079A90)
                              : Color(0xFF7B7B7B),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
