import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medapp/Redux/AuthState/AuthStateActions.dart';
import 'package:medapp/Redux/AuthState/AuthStateReducer.dart';
import 'package:medapp/utils/Api.dart';
import 'package:medapp/utils/Colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleLogin() async {
    try {
      final email = emailController.text, password = passwordController.text;
      final storage = FlutterSecureStorage();
      final response = await Api.post(
          "/user/login", {"email": email, "password": password}, "");
      if (response["statusCode"] >= 400) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response["body"]!["message"] ?? "Error while login."),
          backgroundColor: Colors.red,
        ));
        return;
      }
      final String token = response["body"]["data"]["token"];
      await storage.write(key: "token", value: token);
      final store = StoreProvider.of<AuthState>(context);
      store.dispatch(LoginAction(response["body"]["data"]["user"]));
      Navigator.pushReplacementNamed(context, "/");
    } catch (err) {
      print(err);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        backgroundColor: Colors.red,
      ));
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w800),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 0.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 0.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                    letterSpacing: 1.25,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
