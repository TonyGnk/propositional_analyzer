import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';
import '../../screen_list.dart';
import '../Create Share/speaker_icon.dart';

final opacity = StateProvider<double>((ref) => 0);

createSingleGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);

  if (destination == ScreenDestination.home) {
    updateAppBarBackButton(ref, false);
  }
}

createSingleReturn(WidgetRef ref) {
  updateAppBarBackButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Single Analysis', isReturn);
  updateAppBarCustomIcon1(ref, speakerIcon(), isReturn);
  ref.read(opacity.notifier).state = isReturn ? 1 : 0;
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacity),
        duration: basicDuration,
        child: child,
      ),
    );
