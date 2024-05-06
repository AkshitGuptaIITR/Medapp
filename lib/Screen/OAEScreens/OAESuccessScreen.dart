import 'package:flutter/material.dart';
import 'package:medapp/utils/Colors.dart';

class OAESuccessScreen extends StatefulWidget {
  const OAESuccessScreen({super.key});

  @override
  State<OAESuccessScreen> createState() => _OAESuccessScreenState();
}

class _OAESuccessScreenState extends State<OAESuccessScreen> {
  @override
  void initState() {
    super.initState();
    popAfterDelay();
  }

  void popAfterDelay() {
    print("chec");
    Future.delayed(Duration(seconds: 5), () {
      print("chec");
      Navigator.pushNamed(context, "/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "All set!",
                style: TextStyle(fontSize: 24),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  size: 120,
                  color: primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "You have successfully registered!",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
      )),
    );
  }
}
