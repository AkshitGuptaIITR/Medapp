import 'package:flutter/material.dart';
import 'package:medapp/Redux/store.dart';
import 'package:medapp/utils/Colors.dart';
import 'package:medapp/utils/Routes.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MedApp',
        theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: "Kamerik 105 Cyrillic",
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: MaterialColor(
              primaryColor.value,
              <int, Color>{
                50: primaryColor.withOpacity(0.1),
                100: primaryColor.withOpacity(0.2),
                200: primaryColor.withOpacity(0.3),
                300: primaryColor.withOpacity(0.4),
                400: primaryColor.withOpacity(0.5),
                500: primaryColor.withOpacity(0.6),
                600: primaryColor.withOpacity(0.7),
                700: primaryColor.withOpacity(0.8),
                800: primaryColor.withOpacity(0.9),
                900: primaryColor.withOpacity(1.0),
              },
            ),
          ),
          useMaterial3: true,
        ),
        routes: routes,
      ),
    );
  }
}
