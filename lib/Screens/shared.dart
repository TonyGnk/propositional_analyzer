import 'package:flutter/material.dart';

import '../global_variables.dart';

desktopFrame(BuildContext context, Column column, double width,
        EdgeInsets padding) =>
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
              //border: Border.all(color: Theme.of(context).dividerColor),
              //color: Theme.of(context).dividerColor.withOpacity(0.1),
            ),
            padding: padding,
            width: width,
            child: column,
          ),
        ),
      ],
    );
