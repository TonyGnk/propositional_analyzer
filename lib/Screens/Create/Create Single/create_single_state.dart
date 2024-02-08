import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';
import '../../screen_list.dart';

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
  updateAppBarLabel(ref, 'New Analysis', isReturn);
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

speakerIcon() => Consumer(
      builder: (context, ref, _) {
        final isMute = ref.watch(isMuteProvider);
        return IconButton(
          isSelected: isMute,
          tooltip: 'Play Sound At The End',
          selectedIcon: const Icon(Icons.volume_off_outlined),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.onBackground),
          ),
          onPressed: () => ref.read(isMuteProvider.notifier).state = !isMute,
          icon: const Icon(Icons.volume_up_outlined),
          highlightColor: Colors.grey.withOpacity(0.2),
        );
      },
    );

final isMuteProvider = StateProvider<bool>((ref) => true);
