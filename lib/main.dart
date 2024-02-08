import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_manager/window_manager.dart';
import 'algorithms/playground.dart';

import 'UI/Adaptive Folder/adaptive_root.dart';

void main2() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!UniversalPlatform.isWeb) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      fullScreen: false,
      title: 'Propositional Analyzer',
      size: Size(380, 770), //380-770 1050-660
      backgroundColor: Colors.transparent,
      titleBarStyle: TitleBarStyle.normal,
      alwaysOnTop: true,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () {});
  }

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(
    ProviderScope(
      child: buildApp(savedThemeMode: savedThemeMode),
    ),
  );
}

AdaptiveRoot buildApp({AdaptiveThemeMode? savedThemeMode}) => AdaptiveRoot(
      savedThemeMode: savedThemeMode,
      appTitle: 'Propositional Analyzer',
      debugShowFloatingThemeButton: false,
    );

void main() async {
  myFunction();
}
