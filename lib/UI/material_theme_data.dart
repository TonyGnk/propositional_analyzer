import 'dart:developer';

import 'package:flutter/material.dart';

import '../global_variables.dart';

class MaterialThemeData extends TotalTheme {
  @override
  ThemeData light() => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            color: Color.fromARGB(255, 161, 64, 0),
            fontSize: 34,
            fontFamily: 'Play',
            fontWeight: FontWeight.w800,
          ),
          titleSmall: const TextStyle(
            color: Color.fromARGB(255, 22, 22, 22),
            fontSize: 27,
            fontWeight: FontWeight.normal,
            fontFamily: 'Play',
          ),
          headlineMedium: const TextStyle(
            color: Color.fromARGB(255, 22, 22, 22),
            fontSize: 19,
            fontFamily: 'Play',
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: const TextStyle(
            color: Color.fromARGB(255, 255, 246, 242),
            fontSize: 16,
            fontFamily: 'Play',
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: const TextStyle(
            color: Color.fromARGB(255, 161, 64, 0),
            fontSize: 14,
            fontFamily: 'Play',
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: const TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 22, 22, 22),
            fontFamily: 'Play',
          ),
          bodyMedium: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 22, 22, 22),
            fontFamily: 'Play',
          ),
          bodySmall: TextStyle(
            color: const Color.fromARGB(255, 31, 31, 31).withOpacity(0.8),
            fontFamily: 'Play',
          ),
        ),
        navigationDrawerTheme: const NavigationDrawerThemeData(
          backgroundColor: Color.fromARGB(255, 236, 233, 230),
          // backgroundColor: Color.fromARGB(255, 231, 229, 226),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 22, 22, 22),
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 22, 22, 22).withOpacity(0.1),
            ),
            fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
          ),
        ),
        sliderTheme: SliderThemeData(
          thumbColor: const Color.fromRGBO(161, 64, 0, 1),
          activeTrackColor:
              const Color.fromRGBO(161, 64, 0, 1).withOpacity(0.7),
          inactiveTrackColor:
              const Color.fromRGBO(161, 64, 0, 1).withOpacity(0.2),
        ),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 243, 241, 240),
            ),
          ),
        ),
        cardTheme: const CardTheme(
          elevation: 2,
          color: Color.fromARGB(255, 243, 241, 240),
          surfaceTintColor: Color.fromARGB(255, 243, 241, 240),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornerSize)),
          ),
        ),
        colorScheme: const ColorScheme(
          primary: Color.fromRGBO(161, 64, 0, 1),
          //
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          secondary: Color.fromARGB(255, 232, 232, 232),
          onSecondary: Color.fromARGB(255, 0, 0, 0),
          surface: Color.fromARGB(255, 26, 33, 33),
          onSurface: Color.fromARGB(255, 255, 255, 255),
          error: Color.fromARGB(255, 255, 0, 0),
          onError: Color.fromARGB(255, 255, 255, 255),
          background: Color.fromARGB(255, 11, 11, 11),
          onBackground: Color.fromARGB(255, 255, 255, 255),
          brightness: Brightness.light,
        ),
        secondaryHeaderColor: const Color.fromARGB(255, 232, 232, 232),
        splashColor: const Color.fromARGB(255, 224, 219, 215),
        scaffoldBackgroundColor: const Color.fromARGB(255, 224, 219, 215),
        //scaffoldBackgroundColor: const Color.fromARGB(255, 218, 209, 202),
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        // splashColor: const Color.fromARGB(255, 255, 255, 255),
        canvasColor: Colors.deepOrangeAccent,
        unselectedWidgetColor: Colors.orange[100],
        dividerColor: Colors.grey[400],
      );

  @override
  ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            color: Color.fromARGB(255, 230, 126, 78),
            fontSize: 34,
            fontWeight: FontWeight.w800,
            fontFamily: 'Play',
          ),
          titleSmall: const TextStyle(
            color: Color.fromARGB(255, 255, 246, 242),
            fontSize: 27,
            fontWeight: FontWeight.normal,
            fontFamily: 'Play',
          ),
          headlineMedium: const TextStyle(
            color: Color.fromARGB(255, 255, 246, 242),
            fontSize: 19,
            fontFamily: 'Play',
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: const TextStyle(
            color: Color.fromARGB(255, 255, 246, 242),
            //Color.fromARGB(255, 22, 22, 22),
            fontSize: 16,
            fontFamily: 'Play',
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: const TextStyle(
            color: Color.fromARGB(255, 230, 126, 78),
            fontSize: 14,
            fontFamily: 'Play',
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: const TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 255, 246, 242),
            fontFamily: 'Play',
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 255, 246, 242),
            fontFamily: 'Play',
          ),
          bodySmall: TextStyle(
            color: const Color.fromARGB(255, 232, 232, 232).withOpacity(0.8),
            fontFamily: 'Play',
          ),
        ),
        //
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 255, 246, 242),
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 255, 246, 242).withOpacity(0.1),
            ),
            fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
          ),
        ),
        sliderTheme: SliderThemeData(
          thumbColor: const Color.fromARGB(255, 230, 126, 78),
          activeTrackColor:
              const Color.fromARGB(255, 230, 126, 78).withOpacity(0.7),
          inactiveTrackColor:
              const Color.fromARGB(255, 230, 126, 78).withOpacity(0.2),
        ),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 73, 71, 69),
            ),
          ),
        ),
        cardTheme: const CardTheme(
          //#002222
          elevation: 0,
          color: Color.fromARGB(255, 36, 32, 31),
          surfaceTintColor: Color.fromARGB(255, 31, 28, 27),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornerSize)),
          ),
        ),
        colorScheme: const ColorScheme(
          //004347
          primary: Color.fromARGB(255, 230, 126, 78),

          //

          //

          //

          //

          //

          //

          //
          //
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          secondary: Color.fromARGB(255, 232, 232, 232),
          onSecondary: Color.fromARGB(255, 0, 0, 0),
          surface: Color.fromARGB(255, 26, 33, 33),
          onSurface: Color.fromARGB(255, 255, 255, 255),
          error: Color.fromARGB(255, 255, 0, 0),
          onError: Color.fromARGB(255, 255, 255, 255),
          background: Color.fromARGB(255, 11, 11, 11),
          onBackground: Color.fromARGB(255, 255, 255, 255),
          brightness: Brightness.dark,
        ),
        secondaryHeaderColor: const Color.fromARGB(255, 56, 56, 56),
        scaffoldBackgroundColor: const Color.fromARGB(255, 20, 19, 18),
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
