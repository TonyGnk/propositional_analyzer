import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global_variables.dart';
import 'about_constants.dart';
import 'about_update_handler.dart';

Future<String> downloadApp() async {
  String browserDownloadUrl = '';
  final response = await Dio().get(githubApiUrl);
  print(response.statusCode);
  if (response.statusCode == 200) {
    final jsonResponse = response.data;
    browserDownloadUrl = jsonResponse['assets'][0]['browser_download_url'];
  } else {
    throw Exception('Failed to fetch version from GitHub');
  }

  return browserDownloadUrl;
}

Future<void> callDownloadApp() async {
  String downloadUrl = await downloadApp();
  Uri downloadUri = Uri.parse(downloadUrl);
  if (await canLaunchUrl(downloadUri)) {
    await launchUrl(downloadUri);
  } else {
    throw 'Could not launch $downloadUri';
  }
}

Future<void> callWebVersion() async {
  if (await canLaunchUrl(webUrl)) {
    await launchUrl(webUrl);
  } else {
    throw 'Could not launch $webUrl';
  }
}

Future<void> callCode() async {
  if (await canLaunchUrl(codeUrl)) {
    await launchUrl(codeUrl);
  } else {
    throw 'Could not launch $codeUrl';
  }
}

Future<void> callProfile() async {
  if (await canLaunchUrl(tonyGnkUrl)) {
    await launchUrl(tonyGnkUrl);
  } else {
    throw 'Could not launch $tonyGnkUrl';
  }
}

Future<void> callFlutter() async {
  if (await canLaunchUrl(flutterUrl)) {
    await launchUrl(flutterUrl);
  } else {
    throw 'Could not launch $flutterUrl';
  }
}

updateAction(WidgetRef ref, String version, String updateLink) => actionButton(
      () async {
        getLatestVersion(
          ref,
          version,
          updateLink,
        );
      },
      'Check for updates',
      const Icon(Icons.security_update_good_outlined),
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
  String updateLink,
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
                if (await canLaunchUrl(Uri.parse(updateLink))) {
                  await launchUrl(Uri.parse(updateLink));
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
