//import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

Widget customText({
  required String text,
  required BuildContext context,
  TextStyle? style,
  Duration? duration,
  TextAlign? textAlign,
}) =>
    AnimatedDefaultTextStyle(
      duration: duration ?? const Duration(milliseconds: 700),
      style: TextStyle(
        fontSize: style?.fontSize ?? 20,
        color: style?.color ?? Theme.of(context).textTheme.displayLarge!.color,
      ),
      textAlign: textAlign,
      child: Text(text),

      // ElevatedButton(
      //   onPressed: () {
      //     AdaptiveTheme.of(context).setLight();
      //   },
      //   child: Text("Change Theme"),
      // ),
    );
