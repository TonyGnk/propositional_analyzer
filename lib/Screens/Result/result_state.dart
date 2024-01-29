import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../UI/Routed%20Screen/app_bar.dart';

import '../../../Screens/screen_list.dart';
import '../../../Services/constants.dart';

final opacity = StateProvider<double>((ref) => 1);

void resultGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
}

void resultReturn(WidgetRef ref) {
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
