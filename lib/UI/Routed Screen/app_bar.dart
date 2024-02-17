import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../Screens/About/about_actions_row.dart';
import '../../Screens/screen_list.dart';
import '../../global_variables.dart';
import 'info_icon.dart';
import 'theme_icon.dart';

final appBarIsEnableProvider = StateProvider<bool>((ref) => true);
final appBarIsFilledProvider = StateProvider<bool>((ref) => false);
final appBarLabel = StateProvider<String?>((ref) => null);
final appBarLabelOpacity = StateProvider<double>((ref) => 0);
final appBarCurrentScreen = StateProvider<ScreenDestination?>((ref) => null);
final appBarPreviousScreen = StateProvider<ScreenDestination?>((ref) => null);
final appBarBackButtonTimes = StateProvider<int>((ref) => 1);
final appBarDownloadAppOpacity = StateProvider<double>((ref) => 1);

Widget adaptAppBar() => Consumer(builder: (context, ref, _) {
      final isEnable = ref.watch(appBarIsEnableProvider);
      final filled = ref.watch(appBarIsFilledProvider);
      return isEnable
          ? DecoratedBox(
              decoration: filled
                  ? filledBoxDecoration(context)
                  : boxDecoration(context),
              child: row(),
            )
          : const SizedBox();
    });

Widget row() => Consumer(
      builder: (context, ref, _) {
        final isEnableBackButton = ref.watch(appBarIsEnableBackButton);
        final backButtonOpacity = ref.watch(appBarBackButtonOpacity);
        final label = ref.watch(appBarLabel);
        final labelOpacity = ref.watch(appBarLabelOpacity);
        final isEnableThemeButton =
            ref.watch(appBarIsEnableThemeButtonProvider);
        //final previousScreen = ref.watch(appBarPreviousScreen);
        final customIcon1 = ref.watch(appBarCustomIcon1);
        final customIconOpacity = ref.watch(appBarCustomIconOpacity);
        final backButtonTimes = ref.watch(appBarBackButtonTimes);
        final themeIconOpacity = ref.watch(appBarIsEnableThemeButtonOpacity);
        final isEnableInfoButton = ref.watch(appBarIsEnableInfoButtonProvider);
        final infoIconOpacity = ref.watch(appBarIsEnableInfoButtonOpacity);
        final theFloor = ref.watch(appBarSecondFloor);
        final theFloorOpacity = ref.watch(appBarSecondFloorOpacity);
        final downloadAppOpacity = ref.watch(appBarDownloadAppOpacity);
        return Stack(
          children: [
            Row(
              children: [
                const SizedBox(width: 2),
                AnimatedOpacity(
                  opacity: backButtonOpacity,
                  duration: basicDuration,
                  child: isEnableBackButton
                      ? appBarIcon(
                          const Icon(Icons.arrow_back_ios_outlined),
                          () => goBack(ref, backButtonTimes),
                        )
                      : const SizedBox(),
                ),
                AnimatedOpacity(
                  opacity: labelOpacity,
                  duration: basicDuration,
                  child: Text(
                    label ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const Expanded(child: SizedBox()),
                (UniversalPlatform.isWeb &&
                        (MediaQuery.of(context).size.width > 600))
                    ? AnimatedOpacity(
                        opacity: downloadAppOpacity,
                        duration: basicDuration,
                        child: TextButton.icon(
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(160, 44)),
                          ),
                          onPressed: () async => callDownloadApp(),
                          label: const Text('Download App'),
                          icon: const Icon(Icons.download),
                        ),
                      )
                    : const SizedBox(),
                AnimatedOpacity(
                  opacity: customIconOpacity,
                  duration: basicDuration,
                  child: customIcon1 ?? const SizedBox(),
                ),
                AnimatedOpacity(
                  opacity: themeIconOpacity,
                  duration: basicDuration,
                  child: isEnableThemeButton
                      ? themeIcon(context, ref)
                      : const SizedBox(),
                ),
                AnimatedOpacity(
                  opacity: infoIconOpacity,
                  duration: basicDuration,
                  child: isEnableInfoButton ? infoIcon() : const SizedBox(),
                ),
                const SizedBox(width: 2),
              ],
            ),
            Row(
              children: [
                secondFloor1(theFloor, theFloorOpacity),
                const Expanded(child: SizedBox()),
                secondFloor2(theFloor, theFloorOpacity),
              ],
            )
          ],
        );
      },
    );

secondFloor1(List<Widget> theFloor, double theFloorOpacity) => Row(
      children: [
        AnimatedOpacity(
          duration: basicDuration,
          opacity: theFloorOpacity,
          child: theFloor[0],
        ),
      ],
    );

secondFloor2(List<Widget> theFloor, double theFloorOpacity) => Row(
      children: [
        AnimatedOpacity(
          duration: basicDuration,
          opacity: theFloorOpacity,
          child: theFloor[1],
        ),
      ],
    );

filledBoxDecoration(BuildContext context) => BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        width: 1,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(cornerSize),
      ),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    );

boxDecoration(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(cornerSize),
    );

appBarIcon(
  Icon icon,
  void Function() onPressed, [
  String tooltip = '',
  Icon? selectedIcon,
  bool? isSelected,
]) =>
    IconButton(
      tooltip: tooltip != '' ? tooltip : null,
      selectedIcon: selectedIcon,
      isSelected: isSelected,
      onPressed: onPressed,
      icon: icon,
      highlightColor: Colors.grey.withOpacity(0.2),
    );

updateAppBarLabel(WidgetRef ref, String label, bool isReturn) {
  ref.read(appBarLabel.notifier).state = label;
  ref.read(appBarLabelOpacity.notifier).state = isReturn ? 1 : 0;
}

final appBarSecondFloor =
    StateProvider<List<Widget>>((ref) => [const SizedBox(), const SizedBox()]);
final appBarSecondFloorOpacity = StateProvider<double>((ref) => 0);
updateSecondFloor(
    WidgetRef ref, Widget newFloorLeft, Widget newFloorRight, bool isReturn) {
  ref.read(appBarSecondFloor.notifier).state = isReturn
      ? [newFloorLeft, newFloorRight]
      : [const SizedBox(), const SizedBox()];
  ref.read(appBarSecondFloorOpacity.notifier).state = isReturn ? 1 : 0;
}

// A provider for a custom icon in the app bar
final appBarCustomIcon1 = StateProvider<Widget?>((ref) => null);
final appBarCustomIconOpacity = StateProvider<double>((ref) => 0);
updateAppBarCustomIcon1(WidgetRef ref, Widget iconButton, bool isReturn) {
  isReturn
      ? {
          ref.read(appBarCustomIcon1.notifier).state = iconButton,
          ref.read(appBarCustomIconOpacity.notifier).state = 1
        }
      : {
          ref.read(appBarCustomIconOpacity.notifier).state = 0,
          Future.delayed(basicDuration, () {
            ref.read(appBarCustomIcon1.notifier).state = null;
          })
        };
}

// A provider for the back button in the app bar
final appBarIsEnableBackButton = StateProvider<bool>((ref) => true);
final appBarBackButtonOpacity = StateProvider<double>((ref) => 0);
updateAppBarBackButton(WidgetRef ref, bool isReturn) {
  isReturn
      ? {
          ref.read(appBarIsEnableBackButton.notifier).state = true,
          ref.read(appBarBackButtonOpacity.notifier).state = 1
        }
      : {
          ref.read(appBarBackButtonOpacity.notifier).state = 0,
          Future.delayed(basicDuration, () {
            ref.read(appBarIsEnableBackButton.notifier).state = false;
          })
        };
}

final appBarIsEnableThemeButtonProvider = StateProvider<bool>((ref) => true);
final appBarIsEnableThemeButtonOpacity = StateProvider<double>((ref) => 1);
updateThemeButton(WidgetRef ref, bool isReturn) {
  isReturn
      ? {
          ref.read(appBarIsEnableThemeButtonProvider.notifier).state = true,
          ref.read(appBarIsEnableThemeButtonOpacity.notifier).state = 1
        }
      : {
          ref.read(appBarIsEnableThemeButtonOpacity.notifier).state = 0,
          Future.delayed(basicDuration, () {
            ref.read(appBarIsEnableThemeButtonProvider.notifier).state = false;
          })
        };
}

//InfoButton
final appBarIsEnableInfoButtonProvider = StateProvider<bool>((ref) => true);
final appBarIsEnableInfoButtonOpacity = StateProvider<double>((ref) => 1);
updateInfoButton(WidgetRef ref, bool isReturn) {
  isReturn
      ? {
          ref.read(appBarIsEnableInfoButtonProvider.notifier).state = true,
          ref.read(appBarIsEnableInfoButtonOpacity.notifier).state = 1
        }
      : {
          ref.read(appBarIsEnableInfoButtonOpacity.notifier).state = 0,
          Future.delayed(basicDuration, () {
            ref.read(appBarIsEnableInfoButtonProvider.notifier).state = false;
          })
        };
}
