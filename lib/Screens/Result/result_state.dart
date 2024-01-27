import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../UI/Routed%20Screen/app_bar.dart';
import '../../function.dart';

import '../../../Screens/screen_list.dart';
import '../../../Services/constants.dart';

final opacityResultState = StateProvider<double>((ref) => 1);

void resultGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
  destination == ScreenDestination.home
      ? updateAppBarBackButton(ref, false)
      : updateAppBarBackButton(ref, true);

  goTo(ref, destination);
}

void resultReturn(WidgetRef ref) {
  ref.read(appBarPreviousScreen.notifier).state =
      ref.read(appBarCurrentScreen.notifier).state;
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.result;

  Future.delayed(basicDuration, () {
    start(ref);
  });

  updateAppBarBackButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Searching...', isReturn);
  ref.read(opacityResultState.notifier).state = isReturn ? 1 : 0;
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacityResultState),
        duration: basicDuration,
        child: child,
      ),
    );
