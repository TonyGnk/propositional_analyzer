import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Screens/screen_list.dart';
import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';

final opacity = StateProvider<double>((ref) => 1);

void searchMultiGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
}

void searchMultiReturn(WidgetRef ref) {
  updateAppBarBackButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Searching...', isReturn);
  ref.read(opacity.notifier).state = isReturn ? 1 : 0;
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacity),
        duration: basicDuration,
        child: child,
      ),
    );
