import 'package:flutter/material.dart';

desktopFrame(BuildContext context, Column column, double width,
        EdgeInsets padding) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 550),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).dividerColor),
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
          padding: padding,
          width: width,
          child: column,
        ),
      ],
    );
