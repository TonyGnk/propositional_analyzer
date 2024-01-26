import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/screen_list.dart';
import '../../UI/Routed Screen/app_bar.dart';

void settingsGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);

  goTo(ref, destination);
}

void settingsReturn(WidgetRef ref) {
  ref.read(appBarPreviousScreen.notifier).state =
      ref.read(appBarCurrentScreen.notifier).state;
  ref.read(appBarCurrentScreen.notifier).state = ScreenDestination.settings;
  updateAppBarItems(ref, true);
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateAppBarLabel(ref, 'Settings', isReturn);
}
