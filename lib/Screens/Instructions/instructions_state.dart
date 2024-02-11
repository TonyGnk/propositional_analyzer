import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';

final opacity = StateProvider<double>((ref) => 0);

instructionsGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);

  if (destination == ScreenDestination.home) {
    updateAppBarBackButton(ref, false);
  }
}

instructionsReturn(WidgetRef ref) {
  updateAppBarBackButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateThemeButton(ref, !isReturn);
  updateInfoButton(ref, !isReturn);
  updateAppBarCustomIcon1(ref, exitIconButton(), isReturn);
  ref.read(opacity.notifier).state = isReturn ? 1 : 0;
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacity),
        duration: basicDuration,
        child: child,
      ),
    );

exitIconButton() => appBarIcon(
      const Icon(Icons.exit_to_app),
      () {},
    );