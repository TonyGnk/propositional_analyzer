import 'dart:async';
import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

import '../../Components/Buttons/elevated_button.dart';

Widget scaffoldAboutScreenType1(
  BuildContext context,
  String title,
  String version,
) =>
    Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            version,
            style: const TextStyle(fontSize: 18),
          ),
          const Expanded(child: SizedBox()),
          licensesButton(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );

Widget scaffoldAboutScreenType2(
  BuildContext context,
  String title,
  String version,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          filterQuality: FilterQuality.high,
          // AdaptiveTheme.of(context).toString() == 'AdaptiveThemeMode.dark'
          'assets/images/qrCode.png',
          //: 'assets/images/qrCodeL.png',
          //'assets/images/qrCode.png',
          height: MediaQuery.of(context).size.height * 0.42,
        ),
        // CustomListTile(
        //   label: 'App Version: ${_defaultApplicationName(context)} $version',
        //   leftIcon: Icons.description_outlined,
        //   type: Type.top,
        //   onTap: () => log('App Version: $version'),
        // ),
        // CustomListTile(
        //   label: 'Operating System: ${Platform.operatingSystem}',
        //   leftIcon: getIconPlatform(Platform.operatingSystem),
        //   type: Type.none,
        //   onTap: () => log(Platform.operatingSystem),
        // ),
        // CustomListTile(
        //   label: 'Open Source Licenses',
        //   leftIcon: Icons.description_outlined,
        //   type: Type.bottom,
        //   onTap: () => showLicensePage(
        //     context: context,
        //   ),
        // )
      ],
    );

Widget licensesButton(BuildContext context) => AdaptElevatedButton(
      label: 'Open Source Licenses',
      onPressed: () => showLicensePage(
        context: context,
        //applicationName: 'Αριθμομηχανή',
        //applicationVersion: '1.0.0',
        //applicationIcon: const Icon(Icons.settings),
        //applicationLegalese: '© 2021 Αριθμομηχανή',
        useRootNavigator: false,
      ),
    );

Widget aboutAppIconButton = IconButton(
  icon: const Icon(Icons.info_outline_rounded),
  onPressed: () {
    unawaited(AppSettings.openAppSettings());
  },
  iconSize: 26,
  padding: const EdgeInsets.all(12),
);

// String _defaultApplicationName(BuildContext context) {
//   final Title? ancestorTitle = context.findAncestorWidgetOfExactType<Title>();
//   return ancestorTitle?.title ??
//       Platform.resolvedExecutable.split(Platform.pathSeparator).last;
// }

getIconPlatform(String operatingSystem) {
  log(operatingSystem);
  if (operatingSystem == 'android') {
    return Icons.android_outlined;
  } else if (operatingSystem == 'ios') {
    return Icons.phone_iphone_outlined;
  } else if (operatingSystem == 'linux') {
    return Icons.laptop_outlined;
  } else if (operatingSystem == 'macos') {
    return Icons.desktop_mac_outlined;
  } else if (operatingSystem == 'windows') {
    return Icons.desktop_windows_outlined;
  } else {
    return Icons.device_unknown_outlined;
  }
}
