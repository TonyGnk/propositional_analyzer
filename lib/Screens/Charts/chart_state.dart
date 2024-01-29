import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_manager/window_manager.dart';
import '../../UI/Routed%20Screen/app_bar.dart';

import '../../../Screens/screen_list.dart';
import '../../../Services/constants.dart';

final opacity = StateProvider<double>((ref) => 1);

void chartGo(WidgetRef ref, ScreenDestination destination) {
  resetFullScreen();

  updateAppBarItems(ref, false);

  if (destination == ScreenDestination.home) {
    updateAppBarBackButton(ref, false);
  }
}

void chartReturn(WidgetRef ref) {
  updateAppBarBackButton(ref, true);
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Results', isReturn);
  ref.read(opacity.notifier).state = isReturn ? 1 : 0;
  ref.read(appBarBackButtonTimes.notifier).state = isReturn ? 2 : 1;
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacity),
        duration: basicDuration,
        child: child,
      ),
    );

resetFullScreen() async {
  if (UniversalPlatform.isWindows || UniversalPlatform.isLinux) {
    if (await windowManager.isFullScreen()) {
      windowManager.setFullScreen(false);
    }
  } else if (UniversalPlatform.isWeb) {
    FullScreenWindow.setFullScreen(false);
  }
}
