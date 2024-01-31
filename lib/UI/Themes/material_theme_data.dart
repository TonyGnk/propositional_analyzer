import 'dart:developer';

import 'package:flutter/material.dart';

class MaterialThemeData extends TotalTheme {
  @override
  ThemeData light() => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        //#90A4AE to rgb is 144, 164, 174
        colorSchemeSeed: const Color.fromRGBO(255, 110, 64, 1),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            color: Color.fromARGB(255, 31, 31, 31),
          ),
          bodySmall: TextStyle(
              color: const Color.fromARGB(255, 31, 31, 31).withOpacity(0.8)),
        ),
        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          colorScheme: ColorScheme.light(
            primary: diluteColor(const Color.fromARGB(255, 133, 185, 252), 2),
            onPrimary: const Color.fromARGB(255, 133, 185, 252),
          ),
        ),
        secondaryHeaderColor: const Color.fromARGB(255, 232, 232, 232),
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        splashColor: const Color.fromARGB(255, 255, 255, 255),
        canvasColor: Colors.deepOrangeAccent,
        unselectedWidgetColor: Colors.orange[100],
        dividerColor: Colors.grey[400],
      );

  @override
  ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrangeAccent,
        textTheme: TextTheme(
          displayLarge:
              const TextStyle(color: Color.fromARGB(255, 243, 243, 243)),
          bodySmall: TextStyle(
              color: const Color.fromARGB(255, 243, 243, 243).withOpacity(0.8)),
        ),
        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.fromLTRB(22, 11, 22, 11),
          colorScheme: ColorScheme.dark(
            primary: getElevatedColor(Colors.red),
            //Color.fromARGB(255, 43, 43, 43),
            onPrimary: const Color.fromARGB(255, 133, 185, 252),
          ),
        ),
        secondaryHeaderColor: const Color.fromARGB(255, 56, 56, 56),
        scaffoldBackgroundColor: const Color.fromARGB(255, 11, 11, 11),
        shadowColor: const Color.fromARGB(255, 45, 45, 45),
        splashColor: const Color.fromARGB(255, 1, 1, 1),
        canvasColor: Colors.deepOrangeAccent,
        unselectedWidgetColor: Colors.grey[800],
        dividerColor: Colors.grey[700],
      );

  static ThemeData getLightTheme() => MaterialThemeData().light();
  static ThemeData getDarkTheme() => MaterialThemeData().dark();

  @override
  void showType() {
    log('MaterialTheme');
  }

  Color getElevatedColor(Color color) {
    int red = (color.red + (255 - color.red) * 0.8).round();
    int green = (color.green + (255 - color.green) * 0.8).round();
    int blue = (color.blue + (255 - color.blue) * 0.8).round();
    return Color.fromARGB(color.alpha, red, green, blue);
  }

  Color diluteColor(Color originalColor, int steps) {
    int r = originalColor.red;
    int g = originalColor.green;
    int b = originalColor.blue;

    int deltaR = (255 - r) ~/ steps;
    int deltaG = (255 - g) ~/ steps;
    int deltaB = (255 - b) ~/ steps;

    r += deltaR;
    g += deltaG;
    b += deltaB;

    return Color.fromARGB(255, r, g, b);
  }
}

class TotalTheme {
  ThemeData light() => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      );
  ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      );

  //create the method show the type, printing something
  void showType() {
    log('TotalTheme');
  }
}
