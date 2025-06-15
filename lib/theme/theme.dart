import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  primaryColor: Colors.amber[300],
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: Colors.brown[900],
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: Colors.brown[900], fontSize: 24, height: 1.2),
    bodySmall: TextStyle(
      color: const Color.fromARGB(255, 40, 128, 155),
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  ),
);
