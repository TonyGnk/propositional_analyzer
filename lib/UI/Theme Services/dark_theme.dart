import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

//Function
void changeTheme(BuildContext context, String? selectedOption) {
  const int delayed = 400;
  switch (selectedOption) {
    case 'Enable':
      Future.delayed(const Duration(milliseconds: delayed), () {
        AdaptiveTheme.of(context).setDark();
      });

    case 'Disable':
      Future.delayed(const Duration(milliseconds: delayed), () {
        AdaptiveTheme.of(context).setLight();
      });
    case 'System':
      Future.delayed(const Duration(milliseconds: delayed), () {
        AdaptiveTheme.of(context).setSystem();
      });
  }
}
