/// This file contains the left side of the about screen. It contains the `leftColumnAbout` and `headerText` functions.
/// The `leftColumnAbout` function creates the left side of the about screen. It contains the header text and action buttons.
/// The `headerText` function creates a header text with the provided text and text size.
/// The `actionsRow` function creates a row of action buttons.
/// The `findFontSize` function returns the font size for the provided text size.
/// The `updateLinkProvider` provider provides the latest update link. It is used in the `about_update_handler.dart` file.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../about_constants.dart';
import 'about_actions_row.dart';

leftColumnAbout(String? version) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText(aboutText[0], AboutTextSize.large),
        const SizedBox(height: 20),
        headerText(aboutText[1], AboutTextSize.medium),
        const SizedBox(height: 10),
        headerText(aboutText[2], AboutTextSize.small),
        const SizedBox(height: 20),
        headerText(aboutText[3], AboutTextSize.medium),
        const SizedBox(height: 10),
        headerText(aboutText[4], AboutTextSize.small),
        const SizedBox(height: 10),
        headerText(aboutText[5], AboutTextSize.small),
        const SizedBox(height: 10),
        headerText(aboutText[6], AboutTextSize.small),
        const SizedBox(height: 10),
        headerText(aboutText[7], AboutTextSize.small),
        actionsRow(version ?? ''),
      ],
    );

headerText(String text, AboutTextSize textType) => Text(
      text,
      style: TextStyle(
        fontSize: findFontSize(textType),
        fontFamily: 'Play',
      ),
      textAlign: TextAlign.left,
    );

actionsRow(String version) => Consumer(
      builder: (context, ref, _) {
        final updateLink = ref.watch(updateLinkProvider);
        return SizedBox(
          height: 40,
          child: Row(
            children: [
              //versionAction(version),
              profileAction,
              flutterAction,
              updateAction(ref, version, updateLink),
            ],
          ),
        );
      },
    );
