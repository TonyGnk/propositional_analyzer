// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import 'about_constants.dart';
import 'about_actions_row.dart';

Future<void> getLatestVersion(
    WidgetRef ref, String currentVersion, String updateLink) async {
  final String latestVersion;
  final String latestLinkVersion;
  //Find the latest version
  final response = await Dio().get(githubApiUrl);
  print(response.statusCode);
  if (response.statusCode == 200) {
    final jsonResponse = response.data;
    log(jsonResponse['tag_name']);
    latestVersion = jsonResponse['tag_name'];
    print('Latest Version $latestVersion');
    latestLinkVersion = jsonResponse['html_url'];
    //Set the latest version provider  updateLinkProvider
    ref.read(updateLinkProvider.notifier).state = latestLinkVersion.toString();
  } else {
    throw Exception('Failed to fetch version from GitHub');
  }

  // Split versions by '.' and '+'
  List<String> latestVersionParts =
      latestVersion.toString().split(RegExp('[.+]+'));
  //remove the last part of the version
  latestVersionParts.removeLast();
  List<String> currentVersionParts = currentVersion.split(RegExp('[.+]+'));

  String text = findUpdate(latestVersionParts, currentVersionParts);
  if (text == noUpdate) {
    shouldUpdate(ref.context, text, false, updateLink);
  } else {
    shouldUpdate(ref.context, text, true, updateLink);
  }
}

String patchUpdate = 'A patch update is available';
String minorUpdate = 'A minor update is available';
String majorUpdate = 'A major update is available';
String noUpdate = 'No update is available';

findUpdate(
  List<String> latestVersionParts,
  List<String> currentVersionParts,
) {
  int latestPart;
  int currentPart;

  latestPart = int.parse(latestVersionParts[0]);
  currentPart = int.parse(currentVersionParts[0]);
  //9.0 <= 8.0
  if (latestPart > currentPart) return majorUpdate;
  if (latestPart < currentPart) return noUpdate;

  latestPart = int.parse(latestVersionParts[1]);
  currentPart = int.parse(currentVersionParts[1]);
  //9.1 <= 9.0
  if (latestPart > currentPart) return minorUpdate;
  if (latestPart < currentPart) return noUpdate;

  latestPart = int.parse(latestVersionParts[2]);
  currentPart = int.parse(currentVersionParts[2]);
  //9.1.1 <= 9.1.0
  if (latestPart > currentPart) return patchUpdate;
  if (latestPart < currentPart) return noUpdate;

  return noUpdate;
}

shouldUpdate(
    BuildContext context, String text, bool update, String updateLink) {
  print(text);
  ScaffoldMessenger.of(context).showSnackBar(
    snackBar(context, text, update, updateLink),
  );
}
