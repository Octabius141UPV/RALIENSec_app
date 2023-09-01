// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ralien_sec_app/pages/Onboarding_page.dart';
import 'package:ralien_sec_app/pages/home_page.dart';
import 'package:ralien_sec_app/pages/login_page.dart';
import "package:shared_preferences/shared_preferences.dart";
import "package:ralien_sec_app/components/houseContainer.dart";

import 'package:http/http.dart' as http;
import 'dart:convert';

String token = "e981f9c3-8341-4a24-a3dc-a5665cd19bca";

const String apiUrl = "https://ralien-django-backend-2phw75janq-no.a.run.app/";

String getApiUrl() {
  return apiUrl;
}

List<dynamic> jsonHouses = [];

Future<void> callToAPI() async {
  final response = await http
      .get(Uri.parse(getApiUrl() + "api/first_view_opening_app/?token=$token"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    if (data.containsKey("success")) {
      jsonHouses = data["houses"];
    } else {
      print(data["error"]);
    }
  } else {
    print("Error");
  }
}

List<dynamic> getJsonHouses() {
  return jsonHouses;
}

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isNewUser = false;

  @override
  void initState() {
    print("initState_main");
    super.initState();
    checkUserStatus();
    callToAPI();
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
