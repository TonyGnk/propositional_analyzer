import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';
import '../screen_list.dart';
import 'instructions_main.dart';

final opacity = StateProvider<double>((ref) => 0);

instructionsGo(WidgetRef ref, ScreenDestination destination) {
  updateAppBarItems(ref, false);
}

instructionsReturn(WidgetRef ref) {
  //updateAppBarBackButton(ref, true);
  updateAppBarItems(ref, true);
  ref.read(instructionsIndex.notifier).state = 1;
}

updateAppBarItems(WidgetRef ref, bool isReturn) {
  updateThemeButton(ref, !isReturn);
  updateInfoButton(ref, !isReturn);
  //updateAppBarCustomIcon1(ref, exitIconButton(), isReturn);
  ref.read(opacity.notifier).state = isReturn ? 1 : 0;
  updateSecondFloor(ref, const SizedBox(), container(ref), isReturn);
}

animatedColumn(Widget child) => Consumer(
      builder: (context, ref, _) => AnimatedOpacity(
        opacity: ref.watch(opacity),
        duration: basicDuration,
        child: child,
      ),
    );

container(WidgetRef oldRef) => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          circles(),
          IconButton(
            onPressed: () {
              ref.read(instructionsLanguageIsEnglish.notifier).state =
                  !ref.read(instructionsLanguageIsEnglish.notifier).state;
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
    );

//A row of 3 circles
circles() => Consumer(builder: (context, ref, _) {
      final index = ref.watch(instructionsIndex);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          AnimatedContainer(
            duration: basicDuration,
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == 1) ? Colors.grey : Colors.grey.withOpacity(0.2),
            ),
          ),
          const SizedBox(width: 3),
          AnimatedContainer(
            duration: basicDuration,
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == 2) ? Colors.grey : Colors.grey.withOpacity(0.4),
            ),
          ),
          const SizedBox(width: 3),
          AnimatedContainer(
            duration: basicDuration,
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == 3) ? Colors.grey : Colors.grey.withOpacity(0.4),
            ),
          ),
        ],
      );
    });
