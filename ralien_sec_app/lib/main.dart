// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:ralien_sec_app/pages/Onboarding_page.dart';
import 'package:ralien_sec_app/pages/home_page.dart';
import 'package:ralien_sec_app/pages/login_page.dart';
import "package:shared_preferences/shared_preferences.dart";
import "package:ralien_sec_app/components/houseContainer.dart";

import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiUrl = "https://ralien-django-backend-2phw75janq-no.a.run.app/";

String getApiUrl() {
  return apiUrl;
}

void main() {
/*   runApp(MyApp()); */
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isNewUser = false;

  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isNewUser = prefs.getBool("isNewUser") ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget homeScreen;
    if (isNewUser) {
      homeScreen = HomePage();
    } else {
      homeScreen = HomePage();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen,
    );
  }
}
