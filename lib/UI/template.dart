// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Archive/templates/nav_bar.dart';
import 'Routed Screen/routed_screen.dart';
import 'Archive/templates/custom_animated.dart';

class Template extends StatefulWidget {
  const Template({
    required this.screen1,
    this.screen2,
    this.screen3,
    super.key,
  });

  final RoutedScreen screen1;
  final RoutedScreen? screen2;
  final RoutedScreen? screen3;

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) => customAnimatedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          bottomNavigationBar: widget.screen2 != null || widget.screen3 != null
              ? BottomNavBar(
                  index: currentPageIndex,
                  onTap: (value) {
                    setState(() {
                      currentPageIndex = value;
                    });
                  }, //Add in a list the widget. screenX. getName
                  labels: [
                    widget.screen1.getLabel,
                    if (widget.screen2 != null)
                      widget.screen2!.getLabel
                    else
                      '',
                    if (widget.screen3 != null)
                      widget.screen3!.getLabel
                    else
                      '',
                  ],
                  icons: [
                    widget.screen1.getIcon,
                    if (widget.screen2 != null) widget.screen2!.getIcon,
                    if (widget.screen3 != null) widget.screen3!.getIcon,
                  ],
                  iconsOutlined: [
                    widget.screen1.getIcon,
                    if (widget.screen2 != null) widget.screen2!.getIcon,
                    if (widget.screen3 != null) widget.screen3!.getIcon,
                  ],
                ).build(currentPageIndex)
              : const SizedBox(),
          body: <Widget>[
            widget.screen1.build(context),
            widget.screen2 != null
                ? widget.screen2!.build(context)
                : const SizedBox(),
            widget.screen3 != null
                ? widget.screen3!.build(context)
                : const SizedBox(),
          ][currentPageIndex],
        ),
      );
}

final OneUi = StateProvider<bool>((ref) => true);

//final tabletMode = StateProvider<bool>((ref) => false);

// final darkStatekProvider = StateProvider<bool>((ref) {
//   final sharedPreferencesAsyncValue = ref.watch(prefs);
//   return sharedPreferencesAsyncValue.when(
//     data: (sharedPreferences) {
//       bool? darkEnabled = sharedPreferences.getBool('darkMode');
//       if (darkEnabled != null) {
//         return darkEnabled;
//       } else {
//         return false;
//       }
//     },
//     loading: () => false,
//     error: (error, stackTrace) => false,
//   );
// });

// final prefs = FutureProvider<SharedPreferences>((ref) async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   return sharedPreferences;
// });

//enum StateProviderType { oneUi, material }

// final selectedStateProviderType = StateProvider<StateProviderType>((ref) {
//   final sharedPreferencesAsyncValue = ref.watch(prefs);
//   return sharedPreferencesAsyncValue.when(
//     data: (sharedPreferences) {
//       String? selectedType = sharedPreferences.getString('UITHEME');
//       if (selectedType == 'oneUi') {
//         print(selectedType);
//         return StateProviderType.oneUi;
//       } else {
//         print(selectedType);
//         return StateProviderType.material;
//       }
//     },
//     loading: () => StateProviderType.oneUi,
//     error: (error, stackTrace) => StateProviderType.oneUi,
//   );
// });
