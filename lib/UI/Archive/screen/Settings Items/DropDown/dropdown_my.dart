// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../../Components/List Tiles/list_tile_modifier.dart';
import '../../../../Theme Services/dark_theme.dart';

class MyDropdownWidget extends StatefulWidget {
  const MyDropdownWidget({super.key});

  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String selectedOption = 'Null'; // Η αρχική επιλογή

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            ListTileModifier(
              name: 'Dark Theme',
              subtitle: getCurrentTheme(context),
              cornerType: 'Both',
              onTap: () {
                _showPopupMenu(context);
              },
            ),
          ],
        ),
      );

  String getCurrentTheme(BuildContext context) {
    if (AdaptiveTheme.of(context).mode.toString() == 'AdaptiveThemeMode.dark') {
      selectedOption = 'Enable';
      return 'Enable';
    } else if (AdaptiveTheme.of(context).mode.toString() ==
        'AdaptiveThemeMode.light') {
      selectedOption = 'Disable';
      return 'Disable';
    } else {
      selectedOption = 'System';
      return 'System';
    }
  }

  // Συνάρτηση για να εμφανίσει το dropdown menu
  void _showPopupMenu(BuildContext context) async {
    final result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 140, 0, 0),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Enable',
          child: ListTile(
            title: const Text('Enable'),
            trailing: selectedOption == 'Enable'
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
          ),
        ),
        PopupMenuItem<String>(
          value: 'Disable',
          child: ListTile(
            title: const Text('Disable'),
            trailing: selectedOption == 'Disable'
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
          ),
        ),
        PopupMenuItem<String>(
          value: 'System',
          child: ListTile(
            title: const Text('System'),
            trailing: selectedOption == 'System'
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
          ),
        ),
      ],
    );

    if (result != null) {
      setState(() {
        changeTheme(context, result);
      });
    }
  }
}
