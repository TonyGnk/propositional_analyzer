import 'package:flutter/material.dart';

import '../global_variables.dart';

desktopFrame(
  BuildContext context,
  Column column, [
  double width = 800,
  EdgeInsets padding = const EdgeInsets.all(5),
]) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            color: Theme.of(context).navigationDrawerTheme.backgroundColor,
            elevation:
                (Theme.of(context).brightness == Brightness.dark) ? 0 : 2,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 550),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(cornerSize),
                border: (Theme.of(context).brightness == Brightness.dark)
                    ? Border.all(
                        width: 2,
                        color: Theme.of(context)
                            .menuButtonTheme
                            .style!
                            .foregroundColor!
                            .resolve({})!,
                      )
                    : null,
              ),
              padding: padding,
              width: width,
              child: column,
            ),
          ),
        ),
      ],
    );
