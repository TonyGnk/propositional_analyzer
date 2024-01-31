import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/global_variables.dart';
import '../../UI/Routed Screen/info_icon.dart';
import '../screen_list.dart';

final opacity = StateProvider<double>((ref) => 0);

mixGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
}

mixReturn(WidgetRef ref) {
  updateAppBarInfoButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  ref.read(opacity.notifier).state = isReturn ? 1 : 0;
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacity),
        duration: basicDuration,
        child: child,
      ),
    );
