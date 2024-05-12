import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medapp/utils/Api.dart';
import 'package:medapp/utils/Colors.dart';

class MyPatientScreen extends StatefulWidget {
  const MyPatientScreen({super.key});

  @override
  State<MyPatientScreen> createState() => _MyPatientScreenState();
}

class _MyPatientScreenState extends State<MyPatientScreen> {
  dynamic id;
  bool isLoading = true;
  Map<String, dynamic> patient_data = {};
  int oae = 0, bera = 0, pta = 0;
  List<dynamic> reminders = [];

  @override
  void initState() {
    super.initState();
    getPatientData();
  }

  Future<void> getPatientData() async {
    try {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: "token");

      final response = await Api.get("/patient/" + id, token ?? "");

      if (response["statusCode"] >= 400) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response["body"]["message"]),
          backgroundColor: Colors.red,
        ));
        return;
      }

      setState(() {
        isLoading = false;
        patient_data = response["body"]["data"]["patient"];
        oae = response["body"]["data"]!["oae"] ?? 0;
        bera = response["body"]["data"]["bera"] ?? 0;
        pta = response["body"]["data"]["pta"] ?? 0;
      });
      print(response["body"]["data"]["patient"]);
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments;
    return isLoading
        ? Scaffold(
            body: CircularProgressIndicator(),
            backgroundColor: Colors.white,
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 240,
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            patient_data["name"].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Kamerik 105 Cyrillic',
                              fontWeight: FontWeight.w900,
                              height: 0,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Fater's name:",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            patient_data["parentName"].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Mob Number:",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            patient_data["contactNumber"].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(height: 52),
                    Container(
                      child: Image.asset('assets/images/patient.png'),
                    )
                  ],
                )
              ]),
              backgroundColor: Color(0xFF11ADA2),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, right: 24, left: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 82,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      // spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                              child: Text(
                                "OAE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              width: 80,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Text(
                                oae.toString(),
                                style: TextStyle(
                                    color: primaryColor, fontSize: 32),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Container(
                              width: 82,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                  color: Colors.purple[200],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      // spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                              child: Text(
                                "BERA",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              width: 80,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Text(
                                oae.toString(),
                                style: TextStyle(
                                    color: primaryColor, fontSize: 32),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Container(
                              width: 82,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                  color: Color(0xFF11ADA2),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      // spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                              child: Text(
                                "PTA",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              width: 72,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Text(
                                pta.toString(),
                                style: TextStyle(
                                    color: primaryColor, fontSize: 32),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF11ADA2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ]),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(children: [
                          Text(
                            "Reminders",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ))
                        ]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: reminders.length == 0
                          ? Text("No reminders")
                          : Text("data"),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
