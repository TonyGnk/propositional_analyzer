import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/screen_list.dart';
import '../../Services/constants.dart';
import 'info_icon.dart';
import 'theme_icon.dart';

final appBarIsEnableProvider = StateProvider<bool>((ref) => true);
final appBarIsFilledProvider = StateProvider<bool>((ref) => false);
final appBarIsEnableThemeButtonProvider = StateProvider<bool>((ref) => true);
final appBarLabel = StateProvider<String?>((ref) => null);
final appBarLabelOpacity = StateProvider<double>((ref) => 0);
final appBarCurrentScreen = StateProvider<ScreenDestination?>((ref) => null);
final appBarPreviousScreen = StateProvider<ScreenDestination?>((ref) => null);

Widget adaptAppBar() => Consumer(builder: (context, ref, _) {
      final isEnable = ref.watch(appBarIsEnableProvider);
      final filled = ref.watch(appBarIsFilledProvider);
      return isEnable
          ? DecoratedBox(
              decoration: filled
                  ? filledBoxDecoration(context)
                  : boxDecoration(context),
              child: row(context),
            )
          : const SizedBox();
    });

Widget row(BuildContext context) => Consumer(
      builder: (context, ref, _) {
        final isEnableBackButton = ref.watch(appBarIsEnableBackButton);
        final backButtonOpacity = ref.watch(appBarBackButtonOpacity);
        final label = ref.watch(appBarLabel);
        final labelOpacity = ref.watch(appBarLabelOpacity);
        final isEnableThemeButton =
            ref.watch(appBarIsEnableThemeButtonProvider);
        final previousScreen = ref.watch(appBarPreviousScreen);
        final customIcon1 = ref.watch(appBarCustomIcon1);
        final customIconOpacity = ref.watch(appBarCustomIconOpacity);
        return Row(
          children: [
            const SizedBox(width: 2),
            AnimatedOpacity(
              opacity: backButtonOpacity,
              duration: basicDuration,
              child: isEnableBackButton
                  ? appBarIcon(
                      const Icon(Icons.arrow_back_ios_outlined),
                      () => go(ref, previousScreen ?? ScreenDestination.home),
                    )
                  : const SizedBox(),
            ),
            AnimatedOpacity(
              opacity: labelOpacity,
              duration: basicDuration,
              child: Text(
                label ?? '',
                style: const TextStyle(fontSize: 19, fontFamily: 'Play'),
              ),
            ),
            const Expanded(child: SizedBox()),
            AnimatedOpacity(
              opacity: customIconOpacity,
              duration: basicDuration,
              child: customIcon1 ?? const SizedBox(),
            ),
            themeIcon(context, ref, isEnableThemeButton),
            infoIcon(),
            const SizedBox(width: 2),
          ],
        );
      },
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
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
      ),
      onPressed: onPressed,
      icon: icon,
      highlightColor: Colors.grey.withOpacity(0.2),
    );

updateAppBarLabel(WidgetRef ref, String label, bool isReturn) {
  ref.read(appBarLabel.notifier).state = label;
  ref.read(appBarLabelOpacity.notifier).state = isReturn ? 1 : 0;
}

// A provider for a custom icon in the app bar
final appBarCustomIcon1 = StateProvider<IconButton?>((ref) => null);
final appBarCustomIconOpacity = StateProvider<double>((ref) => 0);
updateAppBarCustomIcon1(WidgetRef ref, IconButton iconButton, bool isReturn) {
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
