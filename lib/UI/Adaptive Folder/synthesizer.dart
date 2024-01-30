import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/screen_list.dart';
import '../Adaptive Templates/body_with_appbar.dart';
import '../Routed Screen/app_bar.dart';

Widget synthesizerDefault() => Consumer(builder: (context, ref, _) {
      final currentScreen = ref.watch(currentScreenProvider);
      final screenWidth = MediaQuery.of(context).size.width;
      final isLargeNow = false;
      return bodyWithAppBarGlass(
        appBar: appBar(context),
        body: screenMap[isLargeNow ? ScreenDestination.mix : currentScreen]!,
      );
    });

Widget appBar(BuildContext context) => Consumer(
      builder: (context, ref, _) => adaptAppBar(),
    );

final currentScreenProvider = StateProvider<ScreenDestination>(
  (ref) => ScreenDestination.home,
);

final List<ScreenDestination> screenStack = [ScreenDestination.home];
