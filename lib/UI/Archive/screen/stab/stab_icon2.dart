//This is a class for extending the iconbutton widget with custom properties

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {required this.name, required this.icon, super.key, this.onFunction});

  const CustomIconButton.empty({super.key})
      : name = '',
        icon = Icons.error,
        onFunction = null;
  final String name;
  final IconData icon;
  final Function? onFunction;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(icon, color: Theme.of(context).colorScheme.onBackground),
        onPressed: () {
          onFunction != null ? onFunction!() : null;
        },
        tooltip: name,
      );
}
