import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Screens/screen_list.dart';
import '../Adaptive Templates/body_with_appbar.dart';
import '../Routed Screen/app_bar.dart';

Widget synthesizerDefault() => Consumer(builder: (context, ref, _) {
      final currentScreen = ref.watch(currentScreenProvider);
      return bodyWithAppBarGlass(
        appBar: appBar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getCurrentScreen(currentScreen),
        ),
      );
    });

Widget appBar(BuildContext context) => Consumer(
      builder: (context, ref, _) => adaptAppBar(),
    );

final currentScreenProvider = StateProvider<ScreenDestination>(
  (ref) => ScreenDestination.home,
);
