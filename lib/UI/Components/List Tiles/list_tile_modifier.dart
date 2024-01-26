import 'package:flutter/material.dart';

import '../../Theme Services/ui_handler.dart';

class ListTileModifier extends StatelessWidget {
  const ListTileModifier({
    required this.name,
    this.padding = const EdgeInsets.all(0),
    this.subtitle,
    this.iconLeft,
    this.iconRight,
    this.onTap,
    this.cornerType = 'Both',
    super.key,
  });

  final String name;
  final EdgeInsets padding;
  final String? subtitle;
  final void Function()? onTap;
  final Icon? iconLeft;
  final Icon? iconRight;
  final String cornerType;

  @override
  Widget build(BuildContext context) => uiSelector(
        oneUiListTile(
          context,
          name,
          padding,
          subtitle,
          onTap,
          iconLeft,
          iconRight,
          RoundedRectangleBorder(borderRadius: _getBorderRadius()),
        ),
        materialUiListTile(
          context,
          name,
          padding,
          subtitle,
          onTap,
          iconLeft,
          iconRight,
          RoundedRectangleBorder(borderRadius: _getBorderRadius()),
        ),
      );

  BorderRadius _getBorderRadius() {
    switch (cornerType) {
      case 'Both':
        return BorderRadius.circular(32.0);
      case 'Top':
        return const BorderRadius.only(
            topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0));
      case 'Bottom':
        return const BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0));
      case 'None':
        return BorderRadius.circular(0.0); // No rounded corners
      default:
        return BorderRadius.circular(32.0); // Default to 'Both'
    }
  }
}

Widget oneUiListTile(
  BuildContext context,
  String name,
  EdgeInsets padding,
  String? subtitle,
  void Function()? onTap,
  Icon? iconLeft,
  Icon? iconRight,
  ShapeBorder? shapeBorder,
) =>
    ListTile(
      contentPadding: padding,
      leading: iconLeft,
      tileColor: Theme.of(context).listTileTheme.tileColor,
      trailing: iconRight,
      shape: shapeBorder,
      title: Text(name),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            )
          : null,
      onTap: () {
        Future.delayed(const Duration(milliseconds: 75), () {
          onTap!();
        });
      },
    );

Widget materialUiListTile(
        BuildContext context,
        String name,
        EdgeInsets padding,
        String? subtitle,
        void Function()? onTap,
        Icon? iconLeft,
        Icon? iconRight,
        ShapeBorder? shapeBorder) =>
    ListTile(
      contentPadding: padding,
      leading: iconLeft,
      trailing: iconRight,
      shape: shapeBorder,
      title: Text(name),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            )
          : null,
      onTap: () {
        Future.delayed(const Duration(milliseconds: 75), () {
          onTap!();
        });
      },
    );
