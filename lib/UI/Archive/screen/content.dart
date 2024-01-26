import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../template.dart';
import '../templates/custom_animated.dart';

Widget content(BuildContext context, Widget mainChild) =>
    Consumer(builder: (_, WidgetRef ref, __) {
      bool ui = ref.watch(OneUi);

      return GestureDetector(
        onVerticalDragUpdate: (details) {
          // double tempView = ViewHeight += 10;
          // double tempSet = SettingsHeight += 10;
          // double tempViewm = ViewHeight += 10;
          // double tempSetm = SettingsHeight += 10;
          // const debounceDuration = 1;

          // // Εάν υπάρχει ήδη ενεργός χρονομετρητής, ακυρώστε τον
          // _debounceTimer?.cancel();
          // _debounceTimer = Timer(Duration(milliseconds: debounceDuration), () {
          // if (details.delta.dy > 0) {
          //   print("Scroll down");
          //   if (large) {
          //     print("A1");
          //     ref.read(settingsPanel.notifier).state = true;
          //   } else {
          //     print("A2");
          //     ref.read(largeView.notifier).state = true;
          //   }
          // } else if (details.delta.dy < 0) {
          //   print("Scroll up");
          //   print(details.delta.dy);
          //   if (settings) {
          //     print("B1");
          //     ref.read(settingsPanel.notifier).state = false;
          //   } else {
          //     print("B2");
          //     ref.read(largeView.notifier).state = false;
          //   }
          // }
        },
        child: customAnimatedBox(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ui
                    //? !dark
                    ? Theme.of(context).colorScheme.surface
                    //  : Color.fromARGB(255, 25, 25, 25)
                    // : !dark
                    : const Color.fromARGB(0, 255, 255, 255),
                //   : Color.fromARGB(0, 25, 25, 25),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            height: 200,
            padding: const EdgeInsets.fromLTRB(7, 20, 7, 0),
            child: mainChild),
      );
    });
