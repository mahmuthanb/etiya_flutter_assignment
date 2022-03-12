import 'package:etiya_flutter_assignment/data/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light().copyWith(primary: etiyaCorporateMain),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white, fontSize: 25),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: customOutlineInputBorder(Colors.grey.shade700),
    focusedBorder: customOutlineInputBorder(Colors.grey),
    hintStyle: TextStyle(color: Colors.grey.shade700),
    alignLabelWithHint: false,
  ),
);
