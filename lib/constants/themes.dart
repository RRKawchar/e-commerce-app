import 'package:flutter/material.dart';

ThemeData themeData=ThemeData(
  primaryColor: Colors.indigo,
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: Colors.grey,
    prefixIconColor: Colors.grey,
    border:outlineInputBorder,
    focusedBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    errorBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder
  ),

  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.indigo,
      textStyle:const TextStyle(fontSize: 18.0),
      disabledBackgroundColor: Colors.grey
    )
  )
);




OutlineInputBorder outlineInputBorder=const OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.grey
    )
);