// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/login_activity.dart';
import 'package:shared_preference/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const KEYLOGIN = "Login";
  late bool isUserLogin;
  @override
  void initState() {
    super.initState();
    checkLoginAndRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        child: const Center(
            child: Icon(
          Icons.account_circle,
          size: 100,
          color: Colors.white,
        )),
      ),
    );
  }

  void checkLoginAndRoutes() async {
    var prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool(KEYLOGIN);
    Timer(const Duration(seconds: 5), () {
      if (isLogin != null && isLogin) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }
}
