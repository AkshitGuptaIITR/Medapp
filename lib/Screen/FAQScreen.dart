import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medapp/utils/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        systemNavigationBarColor: primaryColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "FAQs",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w900),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          size: 42,
                          color: Colors.grey[600],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      if (currentIdx == 1) {
                        setState(() {
                          currentIdx = 0;
                        });
                      } else {
                        setState(() {
                          currentIdx = 1;
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "1. What is OAE test?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        Spacer(),
                        Icon(currentIdx == 1 ? Icons.remove : Icons.add)
                      ],
                    ),
                  ),
                  currentIdx == 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Otoacoustic emission (OAE) is a test for the inner ear for neonates and newborns. This test takes around 2-10 minutes and the child should be in light sleep and less movement.",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : Container(),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      if (currentIdx == 2) {
                        setState(() {
                          currentIdx = 0;
                        });
                      } else {
                        setState(() {
                          currentIdx = 2;
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2. What is BERA test?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        Spacer(),
                        Icon(currentIdx == 2 ? Icons.remove : Icons.add)
                      ],
                    ),
                  ),
                  currentIdx == 2
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Brain evoked response auditory (BERA) is a diagnosis test for children whose OAE has not passed 3 or more times (after 6 months). The child needs to sleep during the test and takes about 1 hour.",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : Container(),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      if (currentIdx == 3) {
                        setState(() {
                          currentIdx = 0;
                        });
                      } else {
                        setState(() {
                          currentIdx = 3;
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "3. What is Cochlear Implant?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        Spacer(),
                        Icon(currentIdx == 3 ? Icons.remove : Icons.add)
                      ],
                    ),
                  ),
                  currentIdx == 3
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "If the child is referred more than 3 times in OAE screening, then they are given a hearing aid for atleast 3 months. If the child is not benefitted from hearing aid, then they should go for cochlear implant.",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : Container(),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      if (currentIdx == 4) {
                        setState(() {
                          currentIdx = 0;
                        });
                      } else {
                        setState(() {
                          currentIdx = 4;
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            "4. Is there a hearing screening program for infants in India?",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                        ),
                        Spacer(),
                        Icon(currentIdx == 4 ? Icons.remove : Icons.add)
                      ],
                    ),
                  ),
                  currentIdx == 4
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "National Program for the prevention and control of deafness (NPPCD) is a hearing screening program in India for infants.",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : Container(),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      if (currentIdx == 5) {
                        setState(() {
                          currentIdx = 0;
                        });
                      } else {
                        setState(() {
                          currentIdx = 5;
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            "5. Is there any financial assistance for hearing assistive facilities?",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                        ),
                        Spacer(),
                        Icon(currentIdx == 5 ? Icons.remove : Icons.add)
                      ],
                    ),
                  ),
                  currentIdx == 5
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Assistance to Disabled Persons for Purchase/Fitting of Aids/Appliances (ADIP) is a scheme under which financial assistance is provided for hearing assistive facilities. This scheme is for those whose monthly income does not exceed Rs. 20,000/-. For more information, check out ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                TextSpan(
                                  text:
                                      'http://adipcochlearimplant.in/ADIP-scheme.aspx', // Text for the hyperlink
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      try {
                                        await launchUrl(Uri.parse(
                                            'http://adipcochlearimplant.in/ADIP-scheme.aspx'));
                                      } catch (err) {
                                        print(err);
                                      }
                                    },
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
