import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import '../../UI/Routed%20Screen/app_bar.dart';

import '../../../Screens/screen_list.dart';
import '../../../Services/constants.dart';

final opacityResultState = StateProvider<double>((ref) => 1);

void chartGo(WidgetRef ref, ScreenDestination destination) {
  resetFullScreen();

  updateAppBarItems(ref, false);
  destination == ScreenDestination.home
      ? updateAppBarBackButton(ref, false)
      : updateAppBarBackButton(ref, true);

  goTo(ref, destination);
}

resetFullScreen() async {
  if (await windowManager.isFullScreen()) {
    windowManager.setFullScreen(false);
  }
}

void chartReturn(WidgetRef ref) {
  ref.read(appBarPreviousScreen.notifier).state = ScreenDestination.home;
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.result;

  updateAppBarBackButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Results', isReturn);
  ref.read(opacityResultState.notifier).state = isReturn ? 1 : 0;
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacityResultState),
        duration: basicDuration,
        child: child,
      ),
    );
