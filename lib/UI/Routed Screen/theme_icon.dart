import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_bar.dart';

Widget themeIcon(BuildContext context, WidgetRef ref, bool enable) {
  String mode = AdaptiveTheme.of(context).mode.toString();
  return enable
      ? appBarIcon(
          Icon(Icons.wb_sunny_outlined,
              color: Theme.of(context).colorScheme.onBackground),
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
              ? Icon(Icons.dark_mode_outlined,
                  color: Theme.of(context).colorScheme.onBackground)
              : Icon(Icons.contrast_outlined,
                  color: Theme.of(context).colorScheme.onBackground),
          mode == 'AdaptiveThemeMode.dark' ||
              mode == 'AdaptiveThemeMode.system',
        )
      : const SizedBox();
}
