import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:medapp/Redux/AuthState/AuthStateReducer.dart';
import 'package:medapp/Redux/store.dart';
import 'package:medapp/utils/Colors.dart';
import 'package:medapp/utils/Common.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  final Function openDrawer;

  const HomeScreen({Key? key, required this.openDrawer}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";

  void handleRegister() {
    Navigator.pushNamed(context, "/register");
  }

  void handleClinics() {
    Navigator.pushNamed(context, "/clinics");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Positioned(
        top: 0,
        height: MediaQuery.of(context).size.height,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(color: Colors.white),
          child: Text("asd"),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/menu.png'),
          onPressed: () => widget.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF007F77),
        toolbarHeight: 120,
        title: Row(children: [
          Text(
            'Hi! \n${store.state.user != null ? store.state.user["name"] : "null"}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Kamerik 105 Cyrillic',
              fontWeight: FontWeight.w900,
              height: 0,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Container(
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
                      left: 15.42,
                      top: 7.71,
                      child: SizedBox(
                        width: 11.56,
                        height: 18.31,
                        child: Text(
                          'A',
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
                      left: 46,
                      top: 6,
                      child: SizedBox(
                        child: Text(
                          'अ',
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
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Color(0xFF0DA59B),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.person_2_outlined,
                  color: Colors.white,
                ),
              )
            ],
          )
        ]),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: [Image.asset("assets/images/sampleImage.png")]),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: rowItems.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      handleRegister();
                    }
                    if (index == 1) {
                      handleClinics();
                    }
                  },
                  child: Container(
                    width: 84, // or remove the decimal part if not needed
                    height: 101.93,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(0.01, 1.00),
                        end: Alignment(-0.01, -1),
                        colors: [Color(0xFF008C82), Color(0xFF11ADA2)],
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          rowItems[index].icon,
                          color: Colors.white,
                          size: 42,
                        ),
                        Spacer(),
                        Container(
                          decoration: ShapeDecoration(
                            color: Color(0xFF008B81),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          padding: EdgeInsets.all(4),
                          child: Text(
                            rowItems[index].name,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Container(
                  height: 68.51,
                  margin: EdgeInsets.only(top: 32, left: 16, right: 16),
                  decoration: ShapeDecoration(
                    color: Color(0xFF11ADA2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Text(
                        'UPCOMING \nEVENTS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Kamerik 105 Cyrillic',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                        child: Image.asset(
                            "assets/images/contact_iilustration.png"))
                  ]),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
