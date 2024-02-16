/// This file contains the main screen of the about section. It contains the left and right side of the about screen. The left side contains the header text and action buttons. The right side contains the QR code.
library;

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'Left Side/about_left_side.dart';
import 'about_state.dart';
import 'Right Side/about_right_side.dart';

class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({super.key});

  @override
  ConsumerState<AboutScreen> createState() => _AboutState();
}

class _AboutState extends ConsumerState<AboutScreen> {
  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;
  bool? thereIsNewVersionAvailable;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      loadPackageInfo();
      aboutReturn(ref);
    });
  }

  //Function to load the app info
  Future<void> loadPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      appName = info.appName;
      packageName = info.packageName;
      version = info.version;
      buildNumber = info.buildNumber;
      log('buildNumber: $buildNumber');
    });
  }

  @override
  build(BuildContext context) => animatedColumn(
        Row(
          children: [
            const SizedBox(width: 10),
            Expanded(child: leftColumnAbout(version)),
            const SizedBox(width: 10),
            customAboutRightColumn(),
            const SizedBox(width: 10),
          ],
        ),
      );
}
