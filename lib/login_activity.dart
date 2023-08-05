import 'package:flutter/material.dart';
import 'package:shared_preference/splash_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return LoginScreenActivity();
  }
}

class LoginScreenActivity extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        color: Colors.blue[50],
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: ElevatedButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(SplashScreenState.KEYLOGIN, true);

                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                },
                child: const Text("Login Now"))),
      ),
    );
  }
}
