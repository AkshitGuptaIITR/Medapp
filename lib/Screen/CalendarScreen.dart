import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medapp/components/Scheduler.dart';
import 'package:medapp/utils/Colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool _isExpanded = false;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          // Change the color of the status bar
          statusBarColor: Color(0xFF01625C),
          // Change the color of the navigation bar (Android only)
          systemNavigationBarColor: primaryColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              calendar(),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Schedules",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xFF818181,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer calendar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 210),
      curve: Curves.easeInOut,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
        color: Color(0xFF01625C),
      ),
      height: _isExpanded ? 550.0 : 290.0,
      child: Column(
        children: [
          Row(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/images/calendar_flower.png",
                  )),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Scheduler())),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.delete,
                color: Colors.white,
                size: 26,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 26,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2020),
            lastDay: DateTime(2050),
            calendarFormat:
                _isExpanded ? CalendarFormat.month : CalendarFormat.week,
            weekendDays: const [DateTime.sunday],
            availableGestures: AvailableGestures.none,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              weekendStyle:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            // Day Changed
            onDaySelected: (day, events) {
              setState(() {
                _selectedDay = day;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },

            // To style the calendar
            calendarStyle: const CalendarStyle(
                outsideDaysVisible: true,
                outsideTextStyle: TextStyle(color: Color(0xFF908B5B)),
                weekendTextStyle: TextStyle(color: Colors.orange),
                todayDecoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF11ADA2)),
                defaultTextStyle: TextStyle(
                  color: Colors.white,
                )),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: const Divider(
                    color: Colors.white,
                    indent: 144,
                    endIndent: 144,
                    thickness: 2,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
