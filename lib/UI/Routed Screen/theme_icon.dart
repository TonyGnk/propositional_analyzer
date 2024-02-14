import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_bar.dart';

Widget themeIcon(BuildContext context, WidgetRef ref) {
  String mode = AdaptiveTheme.of(context).mode.toString();
  return appBarIcon(
    const Icon(Icons.wb_sunny_outlined),
    () {
      AdaptiveTheme.of(context).toggleThemeMode();
      AdaptiveTheme.of(context).updateState();
    },
    mode == 'AdaptiveThemeMode.dark'
        ? 'Dark Mode'
        : mode == 'AdaptiveThemeMode.system'
            ? 'System Mode'
            : 'Light Mode',
    mode == 'AdaptiveThemeMode.dark'
        ? const Icon(Icons.dark_mode_outlined)
        : const Icon(Icons.contrast_outlined),
    mode == 'AdaptiveThemeMode.dark' || mode == 'AdaptiveThemeMode.system',
  );
}
