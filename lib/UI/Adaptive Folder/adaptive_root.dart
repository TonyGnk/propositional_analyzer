// ignore_for_file: discarded_futures

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';
import '../../global_variables.dart';
import 'root_config.dart';
import '../Theme Services/ui_change.dart';
import '../material_theme_data.dart';

class AdaptiveRoot extends ConsumerStatefulWidget {
  const AdaptiveRoot({
    required this.appTitle,
    this.savedThemeMode,
    super.key,
    this.debugShowFloatingThemeButton = false,
  });

  /// The title of the app in recent apps, tittle bar, etc
  final String appTitle;

  final AdaptiveThemeMode? savedThemeMode;

  /// Show a floating button for light/dark and system theme. Defaults to false.
  final bool debugShowFloatingThemeButton;

  @override
  ConsumerState<AdaptiveRoot> createState() => _AdaptiveRootState();
}

class _AdaptiveRootState extends ConsumerState<AdaptiveRoot>
    with WidgetsBindingObserver {
  TotalTheme? theme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setUiTheme();
  }

  Future<void> setUiTheme() async {
    final theme = await getUITheme();
    setState(() {
      this.theme = theme;
    });
  }

  @override
  void didChangeMetrics() {
    if (UniversalPlatform.isAndroid) {
      ref.read(isDesktopProvider.notifier).state = false;
    } else {
      bool newState = View.of(context).physicalSize.width > 600;
      if (ref.read(isDesktopProvider.notifier).state != newState) {
        ref.read(isDesktopProvider.notifier).state = newState;
      }
    }
  }

  @override
  Widget build(BuildContext context) => theme != null
      ? rootConfig(
          context,
          theme!,
          widget.savedThemeMode,
          widget.appTitle,
          widget.debugShowFloatingThemeButton,
        )
      : circularProgressScreen();
}

Widget circularProgressScreen() => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Loading Theme...'),
            ],
          ),
        ),
      ),
    );
