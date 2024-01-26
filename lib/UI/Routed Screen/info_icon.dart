import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Screens/screen_list.dart';
import '../../Services/constants.dart';
import 'app_bar.dart';

Widget infoIcon() => Consumer(builder: (context, ref, _) {
      final enable = ref.watch(appBarIsEnableInfoButtonProvider);
      final opacity = ref.watch(appBarInfoButtonOpacity);
      return AnimatedOpacity(
        opacity: opacity,
        duration: basicDuration,
        child: enable
            ? appBarIcon(
                Icon(Icons.info_outlined,
                    color: Theme.of(context).colorScheme.onBackground),
                () {
                  go(ref, ScreenDestination.about);
                },
                'About App',
              )
            : const SizedBox(),
      );
    });

// A widget that displays the 'About' page.
final appBarIsEnableInfoButtonProvider = StateProvider<bool>((ref) => false);
final appBarInfoButtonOpacity = StateProvider<double>((ref) => 0);
updateAppBarInfoButton(WidgetRef ref, bool isReturn) {
  isReturn
      ? {
          ref.read(appBarIsEnableInfoButtonProvider.notifier).state = true,
          ref.read(appBarInfoButtonOpacity.notifier).state = 1
        }
      : {
          ref.read(appBarInfoButtonOpacity.notifier).state = 0,
          Future.delayed(basicDuration, () {
            ref.read(appBarIsEnableInfoButtonProvider.notifier).state = false;
          })
        };
}
