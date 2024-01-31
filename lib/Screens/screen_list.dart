import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Charts/chart_main.dart';
import 'Charts/chart_state.dart';
import 'Create/create_main.dart';
import 'Create/create_state.dart';
import 'Mix/mix_main.dart';
import 'Mix/mix_state.dart';
import 'Result/result_main.dart';
import 'Result/result_state.dart';

import '../Services/global_variables.dart';
import '../UI/Adaptive Folder/synthesizer.dart';
import '../UI/Screens/About/about_main.dart';
import '../UI/Screens/About/about_state.dart';
import '../UI/Screens/settings.dart';
import '../UI/Screens/settings_state.dart';
import 'Home/home_state.dart';
import 'Home/home_main.dart';

enum ScreenDestination {
  home,
  create,
  result,
  chart,
  mix,
  settings,
  about,
}

goTo(WidgetRef ref, ScreenDestination destination) async {
  //call map screen go with
  screenGo[screenStack.last]!(
    ref,
    destination,
  );
  Future.delayed(basicDuration, () {
    ref.read(currentScreenProvider.notifier).state = destination;
    screenStack.add(destination);
  });
}

goBack(WidgetRef ref, [int times = 1]) async {
  screenGo[screenStack.last]!(
    ref,
    screenStack[screenStack.length - 2],
  );
  Future.delayed(basicDuration, () {
    for (int i = 0; i < times; i++) {
      screenStack.removeLast();
    }
    ref.read(currentScreenProvider.notifier).state = screenStack.last;
  });
}

final Map<ScreenDestination, Widget> screenMap = {
  ScreenDestination.home: const Home(),
  ScreenDestination.create: const Create(),
  ScreenDestination.result: const Result(),
  ScreenDestination.chart: const Chart(),
  ScreenDestination.mix: const Mix(),
  ScreenDestination.settings: const Settings(),
  ScreenDestination.about: const AboutScreen(),
};

final Map<ScreenDestination, void Function(WidgetRef, ScreenDestination)>
    screenGo = {
  ScreenDestination.home: homeGo,
  ScreenDestination.create: createGo,
  ScreenDestination.result: resultGo,
  ScreenDestination.chart: chartGo,
  ScreenDestination.mix: mixGo,
  ScreenDestination.settings: settingsGo,
  ScreenDestination.about: aboutGo,
};
