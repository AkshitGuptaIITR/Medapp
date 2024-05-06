import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:medapp/utils/Api.dart';
import 'package:medapp/utils/Colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _parentsName = TextEditingController();
  TextEditingController _childName = TextEditingController();
  DateTime? _selectedDate;
  TextEditingController _dateInput = TextEditingController();
  TextEditingController _contactNumber = TextEditingController();
  TextEditingController _certificateNumber = TextEditingController();
  TextEditingController _aadharNumber = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _place = TextEditingController();
  TextEditingController _birthWeight = TextEditingController();

  String deliveryType = "RIGHT_TIME";
  String type = "NORMAL";
  String birthCry = "NORMAL";
  String blueeness = "NO";

  List<DropdownMenuItem<String>> typeItems = [
    DropdownMenuItem(value: "NORMAL", child: Text("Normal")),
    DropdownMenuItem(value: "C_SECTION", child: Text("C-Section")),
  ];

  List<DropdownMenuItem<String>> birthCryItems = [
    DropdownMenuItem(value: "NORMAL", child: Text("Normal")),
    DropdownMenuItem(value: "DELAYED", child: Text("Delayed")),
  ];

  List<DropdownMenuItem<String>> blueenessType = [
    DropdownMenuItem(value: "YES", child: Text("Yes")),
    DropdownMenuItem(value: "NO", child: Text("No")),
  ];

  List<DropdownMenuItem<String>> deliveryTypeItems = [
    DropdownMenuItem(
      value: "RIGHT_TIME",
      child: Text("Right Time"),
    ),
    DropdownMenuItem(
      value: "PREMATURE",
      child: Text("Premature"),
    ),
    DropdownMenuItem(
      value: "POSTMATURE",
      child: Text("Postmature"),
    ),
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _dateInput.text = DateFormat("dd-MM-yyyy").format(picked);
        _selectedDate = picked;
      });
    }
  }

  Future<void> handleRegistration() async {
    try {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: "token");

      final response = await Api.post(
          "/patient",
          {
            "parentName": _parentsName.text,
            "name": _childName.text,
            "dob": _dateInput.text,
            "contactNumber": _contactNumber.text,
            "birthCertificate": _certificateNumber.text,
            "aadharNumber": _aadharNumber.text,
            "address": _address.text,
            "deliveryPlace": _place.text,
            "deliveryType": deliveryType,
            "deliverySection": type,
            "birthWeight": _birthWeight.text,
            "birthCry": birthCry,
            "blueness": blueeness == "YES",
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

      Navigator.pushReplacementNamed(context, "/oae",
          arguments: response["body"]["data"]["patient"]["id"]);
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 64, right: 24, left: 24, bottom: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Color(0xFF7B7B7B),
                    size: 36,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                "Personal Details",
                style: TextStyle(
                  color: Color(0xFF323F4B),
                  fontSize: 28,
                  fontFamily: 'Kamerik 105 Cyrillic',
                  fontWeight: FontWeight.w700,
                  height: 0.04,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 48),
                child: TextFormField(
                  controller: _parentsName,
                  decoration: InputDecoration(
                    labelText: "Parent's name",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: _childName,
                  decoration: InputDecoration(
                    labelText: "Child's name",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  onTap: () async {
                    _selectDate(context);
                  },
                  controller: _dateInput,
                  decoration: InputDecoration(
                    labelText: "Date Of Birth",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _contactNumber,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: _certificateNumber,
                  decoration: InputDecoration(
                    labelText: "Certificate Number",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: _aadharNumber,
                  decoration: InputDecoration(
                    labelText: "Aadhar Number",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: _address,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Address",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Delivery Details",
                style: TextStyle(
                  color: Color(0xFF7B7B7B),
                  fontSize: 16,
                  fontFamily: 'Kamerik 105 Cyrillic',
                  fontWeight: FontWeight.w900,
                  height: 0.09,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: _place,
                  decoration: InputDecoration(
                    labelText: "Place - Home/Hospital",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            DropdownButtonFormField(
                padding: EdgeInsets.only(top: 12),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                  labelText: 'Birth type',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                  ),
                ),
                value: deliveryType,
                dropdownColor: Colors.white,
                hint: Text(
                  "Select delivery type",
                  style: TextStyle(color: Colors.black),
                ),
                items: deliveryTypeItems,
                onChanged: (value) {
                  setState(() {
                    deliveryType = value.toString();
                  });
                }),
            DropdownButtonFormField(
                padding: EdgeInsets.only(top: 12),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                  labelText: 'Delivery type',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                  ),
                ),
                value: type,
                dropdownColor: Colors.white,
                hint: Text(
                  "Select delivery type",
                  style: TextStyle(color: Colors.black),
                ),
                items: typeItems,
                onChanged: (value) {
                  setState(() {
                    type = value.toString();
                  });
                }),
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: _birthWeight,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: "Birth Weight",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                    ),
                  ),
                )),
            DropdownButtonFormField(
                padding: EdgeInsets.only(top: 12),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                  labelText: 'Birth cry',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                  ),
                ),
                value: birthCry,
                dropdownColor: Colors.white,
                hint: Text(
                  "Blueeness",
                  style: TextStyle(color: Colors.black),
                ),
                items: birthCryItems,
                onChanged: (value) {
                  setState(() {
                    birthCry = value.toString();
                  });
                }),
            DropdownButtonFormField(
                padding: EdgeInsets.only(top: 12),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                  labelText: 'Blueness at birth',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Color(0xFF5F5F5F), width: 0.5),
                  ),
                ),
                value: blueeness,
                dropdownColor: Colors.white,
                hint: Text(
                  "Blueeness",
                  style: TextStyle(color: Colors.black),
                ),
                items: blueenessType,
                onChanged: (value) {
                  setState(() {
                    blueeness = value.toString();
                  });
                }),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                    backgroundColor: MaterialStateProperty.all(primaryColor)),
                onPressed: handleRegistration,
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
