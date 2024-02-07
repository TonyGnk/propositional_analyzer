import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Charts Comparison/chart_comparison_state.dart';
import 'Charts Comparison/charts_comparison_main.dart';
import 'Charts/chart_main.dart';
import 'Charts/chart_state.dart';
import 'Create/Create Multi/create_multi_main.dart';
import 'Create/Create Multi/create_multi_state.dart';
import 'Create/Create Single/create_single_main.dart';
import 'Create/Create Single/create_single_state.dart';

import '../Services/global_variables.dart';
import '../UI/Adaptive Folder/synthesizer.dart';
import '../UI/Screens/About/about_main.dart';
import '../UI/Screens/About/about_state.dart';
import '../UI/Screens/settings.dart';
import '../UI/Screens/settings_state.dart';
import 'Home/home_state.dart';
import 'Home/home_main.dart';
import 'Search/Search Multi/search_multi_main.dart';
import 'Search/Search Multi/search_multi_state.dart';
import 'Search/Search Single/search_single_main.dart';
import 'Search/Search Single/search_single_state.dart';

enum ScreenDestination {
  home,
  createSingle,
  searchSingle,
  chart,
  chartComparison,
  searchMulti,
  createMulti,
  mix,
  settings,
  about,
}

goTo(WidgetRef ref, ScreenDestination destination) async {
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
  ScreenDestination.createSingle: const CreateSingle(),
  ScreenDestination.searchSingle: const SearchSingle(),
  ScreenDestination.chart: const Chart(),
  ScreenDestination.chartComparison: const ChartComparison(),
  ScreenDestination.searchMulti: const SearchMulti(),
  ScreenDestination.createMulti: const CreateMulti(),
  ScreenDestination.settings: const Settings(),
  ScreenDestination.about: const AboutScreen(),
};

final Map<ScreenDestination, void Function(WidgetRef, ScreenDestination)>
    screenGo = {
  ScreenDestination.home: homeGo,
  ScreenDestination.createSingle: createSingleGo,
  ScreenDestination.searchSingle: searchSingleGo,
  ScreenDestination.chart: chartGo,
  ScreenDestination.chartComparison: chartComparisonGo,
  ScreenDestination.createMulti: createMultiGo,
  ScreenDestination.searchMulti: searchMultiGo,
  ScreenDestination.settings: settingsGo,
  ScreenDestination.about: aboutGo,
};
