import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';

import '../../../Screens/screen_list.dart';
import '../Charts Multi/save_icon.dart';
import '../../../UI/Adaptive Folder/synthesizer.dart';

final opacity = StateProvider<double>((ref) => 1);

void chartsSingleGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  ref.read(appBarBackButtonTimes.notifier).state = 1;

  if (destination == ScreenDestination.home) {
    updateAppBarBackButton(ref, false);
  }
}

void chartsSingleReturn(WidgetRef ref) {
  updateAppBarItems(ref, true);

  if (screenStack[screenStack.length - 2] == ScreenDestination.collection) {
    ref.read(appBarBackButtonTimes.notifier).state = 1;
  } else if (screenStack[screenStack.length - 2] ==
      ScreenDestination.createSingle) {
    ref.read(appBarBackButtonTimes.notifier).state = 2;
    updateAppBarBackButton(ref, true);
  } else {
    ref.read(appBarBackButtonTimes.notifier).state = 2;
  }
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Results', isReturn);
  updateAppBarCustomIcon1(ref, saveIcon(saveAnalysisSingle), isReturn);
  ref.read(opacity.notifier).state = isReturn ? 1 : 0;
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacity),
        duration: basicDuration,
        child: child,
      ),
    );
