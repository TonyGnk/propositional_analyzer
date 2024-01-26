import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Public Search Bar/main_search.dart';
import 'Public Tracking Area/public_result.dart';
import 'Public Tracking Area/public_tracking_stage.dart';
import 'Public Tracking Area/public_welcome.dart';
import 'constants.dart';

Widget publicLeftColumn() => Container(
      child: SizedBox(
        width: 330,
        child: Column(
          children: [
            publicSearchBar(false),
            const SizedBox(height: 10),
            Expanded(child: trackingArea()),
          ],
        ),
      ),
    );

Widget trackingArea() => Consumer(
      builder: (context, ref, _) {
        final isAlgorithmEnd = ref.watch(isAlgorithmEndProvider);
        final runOnce = ref.watch(runOnceProvider);
        final isOnTracking = ref.watch(isOnTrackingProvider);
        return templateContainer(
            context, returnType(isAlgorithmEnd, runOnce, isOnTracking));
      },
    );

returnType(bool isAlgorithmEnd, bool hasAlgorithmRunOnce, bool isOnTracking) {
  if (hasAlgorithmRunOnce) {
    if (isAlgorithmEnd) {
      if (!isOnTracking) {
        return resultPanel();
      } else {
        return trackingStage();
      }
    } else {
      return trackingStage();
    }
  } else {
    return trackingWelcome();
  }
}

templateContainer(BuildContext context, Widget child) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      clipBehavior: Clip.antiAlias,
      child: child,
    );

headerText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Play',
      ),
    );

final isAlgorithmEndProvider = StateProvider<bool>((ref) => false);
final runOnceProvider = StateProvider<bool>((ref) => false);
final isOnTrackingProvider = StateProvider<bool>((ref) => false);
