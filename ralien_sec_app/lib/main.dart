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

String token = "39fecf68-8bbe-457e-907a-3f116fb6b4f0";

const String apiUrl = "https://ralien-django-backend-2phw75janq-no.a.run.app/";

String getApiUrl() {
  return apiUrl;
}

List<String> jsonHouses = [];

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

List<String> getJsonHouses() {
  return jsonHouses;
}

void main() async {
  /* List<String> imgOwners = [];
  

  //Extraer imagenes de los usuarios de una casa

  for (int i = 0; i < houses.length; i++) {
    for (int j = 0; j < houses[i]["userprofiles"].length; j++) {
      /* jsonHouses[i]["userprofiles"][j]["profile_image"] */
      imgOwners.add(houses[i]["userprofiles"][j]["profile_image"]);
    }
  }

  for (int i = 0; imgOwners.length > i; i++) {
    imgOwnersList.add(Text(imgOwners[i]));
  }

  print(imgOwnersList); */
  /* runApp(MyApp()); */
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
