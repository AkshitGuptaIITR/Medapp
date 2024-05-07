import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medapp/utils/Api.dart';
import 'package:medapp/utils/Colors.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  List<dynamic> _patients = [];
  bool isLoading = true, isDeleting = false;
  Set<String> st = {};

  void getPatients() async {
    try {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: "token");

      final response = await Api.get("/patient", token ?? "");

      if (response["statusCode"] >= 400) {
        print(response["body"]["message"]);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response["body"]["message"]),
          backgroundColor: Colors.red,
        ));
        return;
      }

      setState(() {
        _patients = response["body"]["data"];
        isLoading = false;
      });
      print(response);
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
    super.initState();
    getPatients();
  }

  void handleOnChange(bool? value, String _id) {
    // Update the state of _isChecked
    // when the checkbox is tapped
    if (!st.contains(_id)) {
      setState(() {
        st.add(_id);
      });
    } else {
      setState(() {
        st.remove(_id);
      });
    }
  }

  void deletePatients() async {
    setState(() {
      isLoading = true;
    });
    try {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: "token");

      final response = await Api.delete(
          "/patient/",
          {
            'patientIds': st.toList(),
          },
          token);

      if (response["statusCode"] >= 400) {
        print(response["body"]["message"]);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response["body"]["message"]),
          backgroundColor: Colors.red,
        ));
        return;
      }
      getPatients();
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

  void handleDelete() async {
    if (!isDeleting) {
      setState(() {
        isDeleting = true;
      });
      return;
    }

    if (isDeleting && st.length == 0) {
      setState(() {
        isDeleting = false;
      });
      return;
    }
    print(st.length);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          title: Text(
            'Are you sure you want to delete?',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w900),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    onPressed: () {
                      deletePatients();
                      setState(() {
                        isDeleting = false;
                        st.clear();
                      });
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(50))),
                    child: Text('Yes',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        isDeleting = false;
                        st.clear();
                      });
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(50))),
                    child: Text('No',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
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
            toolbarHeight: 200,
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
                              // Navigator.pop(context);
                            },
                          ),
                        ),
                        Text(
                          "PATIENTS",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: 'Kamerik 105 Cyrillic',
                            fontWeight: FontWeight.w900,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          width: 150,
                          child: Flexible(
                            child: Text(
                              "${_patients.length} people\nregistered",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 140),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/register");
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                isDeleting ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: handleDelete,
                            icon: Icon(
                              Icons.delete,
                              color: isDeleting ? primaryColor : Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.all(1),
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
            backgroundColor: Color(0xFF11ADA2),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 0, left: 24, right: 24),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _patients.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                (_patients[index]!["_id"] ?? "")
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFDEF3F2),
                                  borderRadius: BorderRadius.circular(16)),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: (_patients[index]!["patients"] ?? [])
                                    .length,
                                itemBuilder: (context, idx) {
                                  return ListTile(
                                    leading: Image.asset(
                                      "assets/images/child.png",
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(
                                      (_patients[index]!["patients"]![idx]![
                                                  "parentName"] ??
                                              "")
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      "Patient: ${(_patients[index]!["patients"]![idx]!["name"] ?? "").toString()}",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    trailing: isDeleting
                                        ? Checkbox(
                                            value: st.contains(
                                                _patients[index]!["patients"]![
                                                        idx]!["_id"]
                                                    .toString()),
                                            onChanged: (bool? value) {
                                              handleOnChange(
                                                  value,
                                                  _patients[index]![
                                                          "patients"]![idx]![
                                                      "_id"]);
                                            },
                                            checkColor: Colors
                                                .white, // Change the check color
                                            visualDensity: VisualDensity
                                                .comfortable, // Adjust the density
                                          )
                                        : null,
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
