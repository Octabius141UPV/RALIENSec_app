// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ralien_sec_app/components/my_button.dart';
import 'package:ralien_sec_app/components/my_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ralien_sec_app/components/square.tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //Sing user in method
  void singUserIn() {}
  //Test de request a la API

  void postData() async {
    // Crea el diccionario de encabezados
    Map<String, String> encabezados = {
      'Content-Type': 'application/json', // Ejemplo de un encabezado
    };

    // Crea el cuerpo de la solicitud
    var cuerpo = {
      'identificador': "21",
      'puerta': "15",
    };
    // Convierte el cuerpo a formato JSON
    var cuerpoJson = jsonEncode(cuerpo);

    var url = Uri.parse('https://concise-base-387414.oa.r.appspot.com/check');

    //Solicitud GET
    var response = await http.post(url, headers: encabezados, body: cuerpoJson);

    //Verifica el estado de la solicitud
    if (response.statusCode == 201) {
      //Solicitud exitosa
      var responseData = jsonDecode(response.body);
      print(responseData);
    } else {
      //Solicitud fallida
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //Logo
                Image.asset(
                  'assets/images/bes_security_logo.png',
                  height: 200,
                ),

                const SizedBox(height: 30),

                //Welcome back, you've been missed
                Text(
                  'Welcome back, you\'ve been missed',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                //Username
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                //Password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                //Forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyButton(onTap: singUserIn),

                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(
                      imagePath: 'assets/images/apple-logo-1-1-873250453.png',
                    ),
                    SizedBox(width: 20),
                    SquareTile(
                      imagePath:
                          'assets/images/google-logo-icon-PNG-Transparent-Background-2048x2048-232852337.png',
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member ?",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Register now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ], //children
            ),
          ),
        ),
      ),
    );
  }
}
