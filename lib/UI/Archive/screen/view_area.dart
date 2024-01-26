import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../template.dart';
import '../templates/custom_animated.dart';
import '../templates/custom_text.dart';

Widget viewArea(BuildContext context, String viewText) =>
    Consumer(builder: (_, WidgetRef ref, __) {
      bool ui = ref.watch(OneUi);
      return customAnimatedBox(
        height: ui ? 200 : 0,
        child: Center(
          child: customText(
            context: context,
            text: viewText,
            style: const TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      );
    });
