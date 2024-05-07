import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medapp/utils/Api.dart';
import 'package:medapp/utils/Colors.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  String selectedTab = "OAE";
  dynamic hospitals = [];
  bool isLoading = true;

  void getHospitals() async {
    setState(() {
      isLoading = true;
    });
    try {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: "token");

      final response = await Api.get(
          "/hospital/getAllHospitalsForSpecialization/" + selectedTab,
          token ?? "");
      setState(() {
        hospitals = response["body"]["data"];
        isLoading = false;
      });
    } catch (err) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getHospitals();
  }

  void handleTab(String tab) async {
    setState(() {
      selectedTab = tab;
    });
    getHospitals();
  }

  void handleHospitalSelection(String? id) {
    Navigator.pushNamed(context, "/clinicProfile", arguments: id ?? "");
  }

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
            title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          margin: EdgeInsets.only(left: 6, bottom: 16),
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
                        SizedBox(
                          width: 150,
                          child: Text(
                            "FIND CLINICS\nAND HOSPITAL\nNEAR YOU",
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Kamerik 105 Cyrillic',
                              fontWeight: FontWeight.w900,
                              height: 1.2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/images/clinic.png'),
                  )
                ]),
            backgroundColor: Color(0xFF11ADA2),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => handleTab("OAE"),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                        decoration: BoxDecoration(
                          color: selectedTab != "OAE"
                              ? Colors.white
                              : primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DottedBorder(
                          color: primaryColor,
                          strokeWidth: 2,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          dashPattern: [4],
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          child: Text(
                            "OAE",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: selectedTab == "OAE"
                                    ? Colors.white
                                    : primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => handleTab("BERA"),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        decoration: BoxDecoration(
                          color: selectedTab != "BERA"
                              ? Colors.white
                              : primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DottedBorder(
                          color: primaryColor,
                          strokeWidth: 2,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          dashPattern: [4],
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          child: Text(
                            "BERA",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: selectedTab == "BERA"
                                    ? Colors.white
                                    : primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => handleTab("SPEECH_THERAPY"),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                        decoration: BoxDecoration(
                          color: selectedTab != "SPEECH_THERAPY"
                              ? Colors.white
                              : primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DottedBorder(
                          color: primaryColor,
                          strokeWidth: 2,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          dashPattern: [4],
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          child: Text(
                            "Speech Therapy",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: selectedTab == "SPEECH_THERAPY"
                                    ? Colors.white
                                    : primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : hospitals.length == 0
                      ? Text("No Clinic Found.")
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: hospitals.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  handleHospitalSelection(
                                      hospitals![index]!['_id']);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color:
                                            primaryColor), // Define the border here
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 6,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ], // Optional: Add border radius
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          border:
                                              Border.all(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Icon(
                                          Icons.camera_enhance_outlined,
                                          color: Colors.grey[600],
                                        )),
                                    title: Text(
                                      hospitals![index]!['name'],
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.left,
                                    ),
                                    subtitle: Text(
                                      hospitals![index]!['address'] ??
                                          "Address",
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 8),
                                    minVerticalPadding: 16,
                                    visualDensity: VisualDensity(vertical: 1.5),
                                    trailing: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 32,
                                            width: 80,
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
                                                  padding: EdgeInsets.all(0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0), // Adjust border radius as needed
                                                  ),
                                                  backgroundColor:
                                                      Color(0xFF11ADA2)),
                                            ),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            width: 64,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "1 km",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.yellow,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
            ]),
          ),
        )));
  }
}
