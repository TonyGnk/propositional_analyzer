import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../global_variables.dart';
import '../shared.dart';
import 'Left Side/about_actions_row.dart';
import 'Left Side/about_update_handler.dart';
import 'about_constants.dart';
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
  build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    final updateLink = ref.watch(updateLinkProvider);
    return animatedColumn(
      isDesktop ? desktopView(updateLink) : mobileView(updateLink),
    );
  }

  desktopView(String updateLink) => desktopFrame(
        context,
        Column(children: [
          const Expanded(child: SizedBox()),
          const SizedBox(width: 10),
          actionsRow(version ?? ''),
        ]),
      );

  mobileView(String updateLink) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
                flex: 2,
                child: BasketQr(
                  onTap: callFlutter,
                )),
            const Expanded(
              child: Row(
                children: [
                  Basket(
                    icon: Icons.person_outline_rounded,
                    title: 'Created by\nTonyGnk',
                    onTap: callProfile,
                  ),
                  Basket(
                    icon: Icons.handyman_outlined,
                    title: 'Build With\nFlutter',
                    onTap: callFlutter,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Basket(
                    icon: Icons.code,
                    title: 'View web version\n(Slow)',
                    onTap: callWebVersion,
                  ),
                  Basket(
                      icon: Icons.security_update_outlined,
                      title: 'Check for\nupdate',
                      onTapCheck: checkForUpdate,
                      updateLink: updateLink),
                ],
              ),
            ),
          ],
        ),
      );

  void checkForUpdate(String updateLink) async =>
      await getLatestVersion(ref, version ?? '', updateLink);
}
