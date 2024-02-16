import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global_variables.dart';
import '../about_constants.dart';
import 'about_update_handler.dart';

versionAction(String version) => actionButton(
      () {},
      'Version $version',
      const Icon(Icons.info_outline_rounded),
    );

final profileAction = actionButton(
  () async {
    if (await canLaunchUrl(tonyGnkUrl)) {
      await launchUrl(tonyGnkUrl);
    } else {
      throw 'Could not launch $tonyGnkUrl';
    }
  },
  'Created by TonyGnk',
  const Icon(Icons.person_outline_rounded),
);

Future<void> callProfile() async {
  if (await canLaunchUrl(tonyGnkUrl)) {
    await launchUrl(tonyGnkUrl);
  } else {
    throw 'Could not launch $tonyGnkUrl';
  }
}

final flutterAction = actionButton(
  () async {
    if (await canLaunchUrl(flutterUrl)) {
      await launchUrl(flutterUrl);
    } else {
      throw 'Could not launch $flutterUrl';
    }
  },
  'Build With Flutter',
  const Icon(Icons.handyman_outlined),
);

Future<void> callFlutter() async {
  if (await canLaunchUrl(flutterUrl)) {
    await launchUrl(flutterUrl);
  } else {
    throw 'Could not launch $flutterUrl';
  }
}

updateAction(WidgetRef ref, String version, Uri updateLink) => actionButton(
      () async {
        getLatestVersion(
          ref,
          version,
          updateLink,
        );
      },
      'Check for updates',
      const Icon(Icons.update_outlined),
    );

actionButton(
  VoidCallback onPressed,
  String label,
  Widget icon,
) =>
    TextButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: const TextStyle(fontFamily: 'Play', fontSize: 13),
      ),
      icon: icon,
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerSize - 2),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 149, 173, 214),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 149, 173, 214).withOpacity(0.2),
        ),
      ),
    );

snackBar(
  BuildContext context,
  String message,
  bool showAction,
  Uri updateLink,
) =>
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'Play',
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      action: showAction
          ? SnackBarAction(
              textColor: Theme.of(context).colorScheme.onBackground,
              label: 'Update',
              onPressed: () async {
                if (await canLaunchUrl(updateLink)) {
                  await launchUrl(updateLink);
                } else {
                  throw 'Could not launch $updateLink';
                }
              },
            )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerSize),
      ),
      showCloseIcon: false,
      closeIconColor: Theme.of(context).colorScheme.onBackground,
      backgroundColor: Theme.of(context).shadowColor,
    );

snackBarText(
  BuildContext context,
  String message,
) =>
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'Play',
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerSize),
      ),
      showCloseIcon: false,
      closeIconColor: Theme.of(context).colorScheme.onBackground,
      backgroundColor: Theme.of(context).shadowColor,
    );
