import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medapp/utils/Api.dart';
import 'package:medapp/utils/Colors.dart';

class ClinicProfileScreen extends StatefulWidget {
  const ClinicProfileScreen({super.key});

  @override
  State<ClinicProfileScreen> createState() => _ClinicProfileScreenState();
}

class _ClinicProfileScreenState extends State<ClinicProfileScreen> {
  dynamic id = "", hospitalData = {'specialization': []};
  bool isLoading = true;

  void getHospitalData() async {
    try {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: "token");

      final response =
          await Api.get("/hospital/getHospitalById/" + id, token ?? "");

      if (response["statusCode"] >= 400) {
        print(response["body"]["message"]);
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response["body"]["message"]),
          backgroundColor: Colors.red,
        ));
        return;
      }

      print(response["body"]["data"]);
      setState(() {
        isLoading = false;
        hospitalData = response["body"]["data"];
      });
      print(response["body"]["data"]);
    } catch (err) {
      print(err);
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHospitalData();
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 240,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 42,
              height: 42,
              margin: EdgeInsets.only(left: 6),
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                "assets/images/hospital.png",
              ),
            )
          ],
        ),
        backgroundColor: Color(0xFF11ADA2),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hospitalData!["name"] ?? "",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              hospitalData["address"] ?? "Address",
                              softWrap: true,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "1 km",
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.yellow[600],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Screening Available",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Wrap(
                          children: [
                            SizedBox(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    hospitalData!["specialization"].length ?? 0,
                                itemBuilder: (context, index) {
                                  return IntrinsicWidth(
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: null,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Text(
                                            hospitalData!["specialization"]![
                                                    index] ??
                                                [],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900))),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Diagnosis Available",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Wrap(
                            children: [
                              SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      hospitalData!["diagnosis"].length ?? 0,
                                  itemBuilder: (context, index) {
                                    return IntrinsicWidth(
                                      child: Container(
                                          margin: EdgeInsets.only(right: 16),
                                          alignment: Alignment.center,
                                          width: null,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Text(
                                              hospitalData!["diagnosis"]![
                                                      index] ??
                                                  [],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.w900))),
                                    );
                                  },
                                ),
                              )
                            ],
                          )),
                      Text(
                        "Specialists Available",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Wrap(
                            children: [
                              SizedBox(
                                height: 68,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      hospitalData!["specialists"].length ?? 0,
                                  itemBuilder: (context, index) {
                                    return IntrinsicWidth(
                                      child: Container(
                                          margin: EdgeInsets.only(right: 16),
                                          alignment: Alignment.center,
                                          width: 150,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                hospitalData!["specialists"]![
                                                        index]!["name"] ??
                                                    [],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w900),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                  hospitalData!["specialists"]![
                                                      index]!["specialization"])
                                            ],
                                          )),
                                    );
                                  },
                                ),
                              )
                            ],
                          )),
                      Text(
                        "Hearing Assistive Facilities",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Wrap(
                            children: [
                              SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      hospitalData!["facilities"].length ?? 0,
                                  itemBuilder: (context, index) {
                                    return IntrinsicWidth(
                                      child: Container(
                                          margin: EdgeInsets.only(right: 16),
                                          alignment: Alignment.center,
                                          width: null,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Text(
                                              hospitalData!["facilities"]![
                                                      index] ??
                                                  [],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.w900))),
                                    );
                                  },
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Make an Appointment",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
