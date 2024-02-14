import 'package:flutter/material.dart';

import '../global_variables.dart';

desktopFrame(BuildContext context, Column column,
        [double width = 800, EdgeInsets padding = const EdgeInsets.all(5)]) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Theme.of(context).navigationDrawerTheme.backgroundColor,
          elevation: 2,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 550),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cornerSize),
            ),
            padding: padding,
            width: width,
            child: column,
          ),
        ),
      ],
    );
