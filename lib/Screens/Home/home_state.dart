import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/constants.dart';
import '../../UI/Routed Screen/app_bar.dart';
import '../../UI/Routed Screen/info_icon.dart';
import '../screen_list.dart';

final opacity = StateProvider<double>((ref) => 0);

homeGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
}

homeReturn(WidgetRef ref) {
  updateAppBarInfoButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(opacity.notifier).state = isReturn ? 1 : 0;
  updateAppBarBackButton(ref, false);
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacity),
        duration: basicDuration,
        child: child,
      ),
    );
