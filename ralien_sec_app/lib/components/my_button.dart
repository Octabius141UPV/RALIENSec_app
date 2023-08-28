import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          color: Color.fromARGB(255, 105, 60, 160),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          child: Text(
            "Sing in",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
