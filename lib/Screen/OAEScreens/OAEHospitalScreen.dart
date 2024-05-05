import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medapp/utils/Api.dart';
import 'package:medapp/utils/Colors.dart';

class OAEHospitalScreen extends StatefulWidget {
  const OAEHospitalScreen({super.key});

  @override
  State<OAEHospitalScreen> createState() => _OAEHospitalScreenState();
}

class _OAEHospitalScreenState extends State<OAEHospitalScreen> {
  dynamic id, city;
  List<dynamic> cities = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<dynamic>> fetchCities() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");
    if (token == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("You don't have access to perform this action."),
        backgroundColor: Colors.red,
      ));
      return [];
    }

    try {
      final response = await Api.get(
          "/hospital/getAllHospitalsForCity/" + city, token ?? "");
      if (response["statusCode"] >= 400) {
        print(response["body"]);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: response["body"]!["data"]!["message"] ??
                "Something Went Wrong!",
            backgroundColor: Colors.red,
          ),
        );
        return [];
      }
      cities = response["body"]!["data"]!["hospitals"];
      return cities;
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        backgroundColor: Colors.red,
      ));
      return [];
    }
  }

  Future<void> handleYesClick() async {
    Navigator.pushNamed(context, "/oaeLastScreening", arguments: id);
  }

  Future<void> handleNoClick() async {
    Navigator.pushNamed(context, "/");
  }

  Future<void> handleCitySelection(dynamic data) async {
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      id = arguments['id'];
      city = arguments['city'];
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
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
                  Text("City: $city",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF323F4B),
                          fontWeight: FontWeight.w900)),
                  SizedBox(height: 32),
                  FutureBuilder(
                    future: fetchCities(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              // Displaying data from API
                              return GestureDetector(
                                onTap: () {
                                  handleCitySelection(snapshot.data![index]);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  // height: 110,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            primaryColor), // Define the border here
                                    borderRadius: BorderRadius.circular(
                                        10), // Optional: Add border radius
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          border:
                                              Border.all(color: primaryColor),
                                        ),
                                        child: Icon(
                                          Icons.camera_enhance_outlined,
                                          color: Colors.grey[600],
                                        )),
                                    title: Text(
                                      snapshot.data![index]!['name'],
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.left,
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]!['address'] ??
                                          "Address",
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 8),
                                    minVerticalPadding: 0,
                                    dense: false,
                                    visualDensity: VisualDensity(vertical: 1.5),
                                    trailing: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 32,
                                            child: OutlinedButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Open",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0), // Adjust border radius as needed
                                                  ),
                                                  backgroundColor:
                                                      Color(0xFF11ADA2)),
                                            ),
                                          ),
                                          // Spacer(),
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.yellow,
                                          ),
                                        ]),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
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
      ),
    );
  }
}
