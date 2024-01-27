import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../chart.dart';
import 'Charts/chart_main.dart';
import 'Charts/chart_state.dart';
import 'Result/result_main.dart';
import 'Result/result_state.dart';

import '../Services/constants.dart';
import '../UI/Adaptive Folder/synthesizer.dart';
import '../UI/Screens/About/about_main.dart';
import '../UI/Screens/About/about_state.dart';
import '../UI/Screens/settings.dart';
import '../UI/Screens/settings_state.dart';
import 'Home/home_state.dart';
import 'Home/home_main.dart';

enum ScreenDestination {
  home,
  result,
  chart,
  settings,
  about,
}

//Create the go function with ref and a destination. Reads switch appBarCurrentScreen if is ScreenDestination.terminal call terminalGo etc.
go(WidgetRef ref, ScreenDestination destination) {
  final currentScreen = ref.read(currentScreenProvider.notifier).state;
  switch (currentScreen) {
    case ScreenDestination.home:
      homeGo(ref, destination);
    case ScreenDestination.result:
      resultGo(ref, destination);
    case ScreenDestination.chart:
      chartGo(ref, destination);
    case ScreenDestination.about:
      aboutGo(ref, destination);
    case ScreenDestination.settings:
      settingsGo(ref, destination);

    default:
      homeGo(ref, destination);
  }
}

goTo(WidgetRef ref, ScreenDestination destination) async {
  Future.delayed(basicDuration, () {
    ref.read(currentScreenProvider.notifier).state = destination;
  });
}

getCurrentScreen(ScreenDestination currentScreen) {
  switch (currentScreen) {
    case ScreenDestination.home:
      return const Home();
    case ScreenDestination.result:
      return const Result();
    case ScreenDestination.chart:
      return const Chart();

    case ScreenDestination.settings:
      return const Settings();
    case ScreenDestination.about:
      return const AboutScreen();

    default:
      return const Home();
  }
}
