import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import '../Screens/list.dart';
import '../Themes/material_theme_data.dart';
import 'synthesizer.dart';
import '../Archive/screen/Settings Items/ap.dart';
import '../Routed Screen/routed_screen.dart';

Widget rootConfig(
  BuildContext context,
  TotalTheme theme,
  AdaptiveThemeMode? savedThemeMode,
  String appTitle,
  bool debugShowFloatingThemeButton,
) =>
    AdaptiveTheme(
      light: theme.light(),
      dark: theme.dark(),
      debugShowFloatingThemeButton: debugShowFloatingThemeButton,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
          onGenerateTitle: (context) => appTitle,
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: synthesizer(),
          )),
    );

Map<String, WidgetBuilder> generateRoutes(List<RoutedScreen> screens) {
  Map<String, WidgetBuilder> routes = {};

  for (int i = 0; i < screens.length; i++) {
    String labelWithSlash = screens[i].getLabelWithSlash;
    routes[labelWithSlash] =
        (BuildContext context) => screens[i].build(context);
  }

  // Manually specify routes
  routes['/settings/appearance'] =
      (BuildContext context) => const BasicScreen();
  routes['/about'] = (BuildContext context) => aboutScreen();

  return routes;
}
