import 'package:flutter/material.dart';
import 'package:flutter_precisava/ui/login.dart';

void main() {
  Color secondary = const Color.fromARGB(255, 82, 206, 104);
  Color primary = const Color.fromARGB(255, 0, 156, 59);

  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primary,
      cursorColor: primary,
      dividerColor: secondary,
      scaffoldBackgroundColor: secondary,
      textSelectionColor: secondary,
      textSelectionHandleColor: primary,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white        
      ),
      accentColor: primary,
      buttonColor: primary,
      // textTheme: TextTheme(
      //   body1: TextStyle(
      //     color: Colors.white
      //   )
      // )
    ),
  ));
}