import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medapp/Redux/AuthState/AuthStateActions.dart';
import 'package:medapp/Redux/AuthState/AuthStateReducer.dart';
import 'package:medapp/Screen/CalendarScreen.dart';
import 'package:medapp/Screen/HomeScreen.dart';
import 'package:medapp/Screen/PatientsScreen.dart';
import 'package:medapp/Screen/SettingsScreen.dart';
import 'package:medapp/SharedComponents/BottomAppBarScreen.dart';
import 'package:medapp/SharedComponents/LoadingComponent.dart';
import 'package:medapp/SharedComponents/MyDrawer.dart';
import 'package:medapp/utils/Api.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int idx = 0;
  bool isLoading = false;
  final List pages = [
    (key) => HomeScreen(openDrawer: key),
    () => CalendarScreen(),
    (changeIndex) => PatientsScreen(handleBack: changeIndex),
    (changeIndex) => SettingsScreen(
          handleBack: changeIndex,
        ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeWidget();
  }

  Future<void> _initializeWidget() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");
    setState(() {
      isLoading = true;
    });
    if (token == null) {
      Navigator.pushReplacementNamed(context, "/login");
    }
    if (token != null) {
      try {
        final response = await Api.get("/user/refresh", token);
        if (response["statusCode"] >= 400) {
          Navigator.pushReplacementNamed(context, "/login");
          return;
        }
        final store = StoreProvider.of<AuthState>(context);
        store.dispatch(LoginAction(response["body"]["data"]["user"]));
      } catch (err) {
        print(err);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  void handleChangeIdx(int index) {
    setState(() {
      idx = index;
    });
  }

  void handleOpen() {
    scaffoldKey.currentState?.openDrawer();
  }

  void handleClose() {
    scaffoldKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: LoadingWidget(
              message: "Loading",
            ),
            backgroundColor: Colors.white,
          )
        : Scaffold(
            key: scaffoldKey,
            drawer: MyDrawer(closeDrawer: handleClose),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomAppBarScreen(
              idx: idx,
              callback: handleChangeIdx,
            ),
            body: idx == 0
                ? pages[idx](handleOpen)
                : idx == 2
                    ? pages[idx](handleChangeIdx)
                    : idx == 3
                        ? pages[idx](handleChangeIdx)
                        : pages[idx](),
          );
  }
}
