import 'dart:developer';

import 'package:flutter/material.dart';

import 'material_theme_data.dart';

class OneUIThemeData extends TotalTheme {
  @override
  ThemeData light() => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 0, 114, 222),
          surfaceTint: Color.fromARGB(255, 232, 232, 232),
        ),
        buttonTheme: const ButtonThemeData(
          padding: EdgeInsets.fromLTRB(16, 9, 16, 9),
          colorScheme: ColorScheme.light(
            primary: Color.fromARGB(255, 232, 232, 232),
            onPrimary: Colors.black,
          ),
        ),
        listTileTheme: const ListTileThemeData(
          tileColor: Color.fromARGB(255, 255, 255, 255),
        ),
        secondaryHeaderColor: const Color.fromARGB(255, 232, 232, 232),
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
      );

  @override
  ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 62, 145, 255),
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          surfaceTint: Color.fromARGB(255, 43, 43, 43),
        ),
        buttonTheme: const ButtonThemeData(
          padding: EdgeInsets.fromLTRB(16, 9, 16, 9),
          colorScheme: ColorScheme.dark(
            primary: Color.fromARGB(255, 43, 43, 43),
            onPrimary: Colors.white,
          ),
        ),
        listTileTheme: const ListTileThemeData(
          tileColor: Color.fromARGB(255, 37, 37, 37),
        ),
        secondaryHeaderColor: const Color.fromARGB(255, 54, 54, 54),
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
      );

  static ThemeData getLightTheme() => OneUIThemeData().light();
  static ThemeData getDarkTheme() => OneUIThemeData().dark();

  Color getFilledButtonColor() => dark().colorScheme.primary;

  //create the method show the type, printing oneui
  @override
  void showType() {
    log('OneUITheme');
  }
}
