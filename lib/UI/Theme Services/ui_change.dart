// ignore_for_file: use_build_context_synchronously

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Themes/material_theme_data.dart';
import '../Themes/oneui_theme_data.dart';

Future<String?> getPref() async {
  final prefs = await SharedPreferences.getInstance();
  final savedTheme = prefs.getString('UITHEME');
  //log('UI savedTheme2: $savedTheme');
  return savedTheme;
}

Future<TotalTheme> getUITheme() async {
  final savedTheme = await getPref();
  if (savedTheme == null) {
    return MaterialThemeData();
  }
  return savedTheme.toString() == 'ONEUI'
      ? OneUIThemeData()
      : MaterialThemeData();
}

//Create a function. Call getUiTheme. If the theme is material, return 0. If the theme is oneui, return 1.
Future<int> getUiTheme() async {
  final savedTheme = await getPref();
  //log('---------------------UI savedTheme: $savedTheme');
  if (savedTheme == null) {
    return 0;
  }
  return savedTheme.toString() == 'oneUi' ? 1 : 0;
}

Future<void> toggleUI(BuildContext context, String action) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('UITHEME', action);
  if (action == 'oneUi') {
    AdaptiveTheme.of(context).setTheme(
        light: OneUIThemeData.getLightTheme(),
        dark: OneUIThemeData.getDarkTheme());
  } else {
    AdaptiveTheme.of(context).setTheme(
        light: MaterialThemeData.getLightTheme(),
        dark: MaterialThemeData.getDarkTheme());
  }
}
