import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medapp/Screen/CalendarScreen.dart';
import 'package:medapp/Screen/HomeScreen.dart';
import 'package:medapp/Screen/PatientsScreen.dart';
import 'package:medapp/Screen/SettingsScreen.dart';
import 'package:medapp/SharedComponents/BottomAppBarScreen.dart';
import 'package:medapp/utils/Colors.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  int idx = 0, selectedTip = 0;
  final List pages = [
    (key) => HomeScreen(openDrawer: key),
    () => CalendarScreen(),
    (changeIndex) => PatientsScreen(
          handleBack: changeIndex,
        ),
    (changeIndex) => SettingsScreen(
          handleBack: changeIndex,
        ),
  ];

  void handleChangeIdx(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBarScreen(
        idx: idx,
        callback: handleChangeIdx,
      ),
      body: idx == 0
          ? AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                // Change the color of the status bar
                statusBarColor: primaryColor,
                // Change the color of the navigation bar (Android only)
                systemNavigationBarColor: primaryColor,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
                  child: selectedTip == 0
                      ? Column(children: [
                          Row(
                            children: [
                              Text(
                                "Tips",
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
                          SizedBox(
                            height: 32,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTip = 1;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(color: primaryColor),
                              ),
                              child: Text(
                                "Tips for new parents",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTip = 2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(color: primaryColor),
                              ),
                              child: Text(
                                "Tips for pregnant women",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTip = 3;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(color: primaryColor),
                              ),
                              child: Text(
                                "Signs of Hearing Loss",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ])
                      : selectedTip == 1
                          ? SingleChildScrollView(
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 36,
                                        color: primaryColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedTip = 0;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Tips for new\nparents",
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  '''1. Make sure your child gets all regular childhood vaccines.\n\n2. Keep your child away from loud noises. Noise-induced (acquired) hearing loss is permanent and is always preventable. It is caused by prolonged or repeated exposure to any loud noise over 85 decibels, which is the loudness of sound measured in units called decibels (dB). Common sounds that are higher than 85 dB include power mowers, music concerts, emergency vehicle sirens, airplane jets taking off, fireworks and lawnmowers.\n\n3. Create a quiet home. Here are some recommendations:
\u2022 Set your TV or computer volume to the lowest volume but can still be heard clearly.
\u2022 Buy quiet toys or toys that have a volume control and set it to the lowest volume.
\u2022 If you live in a noisy location, keep windows and doors closed to minimize potentially harmful outside sounds.
\u2022 Use soft inside furnishings, more curtains, cushions and carpets that will absorb more sound.
\u2022 Encourage children to use earplugs or earmuffs if exposure to potentially harmful sounds is likely (e.g. music concerts, fireworks, power tools, lawnmowers).''',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      height: 1.8),
                                ),
                                SizedBox(
                                  height: 16,
                                )
                              ]),
                            )
                          : selectedTip == 2
                              ? SingleChildScrollView(
                                  child: Column(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back,
                                            size: 36,
                                            color: primaryColor,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              selectedTip = 0;
                                            });
                                          },
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Tips for pregnant women",
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      '''As congenital hearing loss can be due to genetic causes, environmental exposures during pregnancy or health complications after birth, some tips to prevent hearing loss includes:
1. Have a healthy lifestyle during pregnancy including routine prenatal care.
2. should not take any drugs
3. Mycin group of drugs should be avoided
4. Jaundice should be prevented
5. Sinuses should be prevented''',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          height: 1.8),
                                    )
                                  ]),
                                )
                              : SingleChildScrollView(
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedTip = 0;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            size: 36,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Signs of Hearing Loss",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      '''Infants
\u2022 Not startled by loud noises
\u2022 Not turn to source of sound by six months
\u2022 Do not say a single word such as “mama” or “dada” by one year
\u2022 Turns head when child sees you but NOT when you only call their name
\u2022 They appear to only hear some sounds but not others

Children
\u2022 Speech is delayed and not clear
\u2022 Does not follow directions, for example, the child can be mistaken for not paying attention or ignoring an adult but could actually be partial hearing loss.
\u2022 Often says “huh”
\u2022 Turns volume on electronics up very loudly''',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          height: 1.8),
                                    )
                                  ]),
                                ),
                ),
              ),
            )
          : idx == 2
              ? pages[idx](handleChangeIdx)
              : idx == 3
                  ? pages[idx](handleChangeIdx)
                  : pages[idx](),
    );
  }
}
