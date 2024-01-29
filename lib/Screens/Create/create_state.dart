import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/constants.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../../UI/Routed Screen/info_icon.dart';
import '../screen_list.dart';

final opacityHomeState = StateProvider<double>((ref) => 0);

final scaleHomeState = StateProvider<double>((ref) => 0.9);

createGo(WidgetRef ref, ScreenDestination destination) {
  //ref.read(hideBackground.notifier).state = true;
  updateAppBarItems(ref, false);
  //hideColors(ref);

  goTo(ref, destination);
}

createReturn(WidgetRef ref) {
  //ref.read(hideBackground.notifier).state = false;
  ref.read(appBarPreviousScreen.notifier).state =
      ref.read(appBarCurrentScreen.notifier).state;
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.home;

  //setColors(ref);
  updateAppBarInfoButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(opacityHomeState.notifier).state = isReturn ? 1 : 0;
  ref.read(scaleHomeState.notifier).state = isReturn ? 1 : 0.9;
  ref.read(appBarIsEnableBackButton.notifier).state = isReturn;
}

//EXTRA
animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacityHomeState),
        duration: basicDuration,
        child: child,
      ),
    );

animatedButtonsRow(Widget child) => Consumer(
      builder: (context, ref, _) {
        final scale = ref.watch(scaleHomeState);
        return AnimatedScale(
          scale: scale,
          duration: basicDuration,
          child: child,
        );
      },
    );
