import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import 'main_search.dart';

int searchSpeed = 0;

final segmentedButtonProvider =
    StateProvider<SpeedType>((ref) => SpeedType.fast);

enum SpeedType { slow, medium, fast }

segmentedSpeed() => Consumer(
      builder: (context, WidgetRef ref, __) {
        final selected = ref.watch(segmentedButtonProvider);
        return SegmentedButton(
          segments: [
            ButtonSegment(
                value: SpeedType.slow,
                label: segmentedText('Slow'),
                tooltip: 'Delay 2 sec',
                icon: const Icon(Icons.troubleshoot_outlined)),
            ButtonSegment(
                value: SpeedType.medium,
                label: segmentedText('Normal'),
                tooltip: 'Delay 400 ms',
                icon: const Icon(Icons.calendar_view_week)),
            ButtonSegment(
                value: SpeedType.fast,
                label: segmentedText('Instant'),
                tooltip: 'No delay',
                icon: const Icon(Icons.calendar_view_month)),
          ],
          selected: {selected},
          onSelectionChanged: (Set<SpeedType> newSelection) {
            ref.read(segmentedButtonProvider.notifier).state =
                newSelection.first;
            searchSpeed = getSpeedFromSlider(newSelection.first);
          },
          style: ButtonStyle(
            visualDensity: VisualDensity.comfortable,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerSize - 2),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ),
            ),
          ),
        );
      },
    );

segmentedText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: 'Play',
      ),
    );

getSpeedFromSlider(SpeedType type) {
  switch (type) {
    case SpeedType.slow:
      return 2000;
    case SpeedType.medium:
      return 400;
    case SpeedType.fast:
      return 0;
  }
}

//Provider for switcher
final switcherProvider = StateProvider<bool>((ref) => true);
bool avoidVisitedIsDisable = false;

//This Switch a enables an optimization for the algorithm
customSwitch() => Consumer(
      builder: (context, ref, _) {
        final switcher = ref.watch(switcherProvider);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(child: fontText('Avoid the visited nodes', 15)),
              Switch(
                value: switcher,
                onChanged: (newValue) {
                  ref.read(switcherProvider.notifier).state = newValue;
                  avoidVisitedIsDisable = !newValue;
                },
              ),
            ],
          ),
        );
      },
    );

final enableTimer = StateProvider<bool>((ref) => true);
int timeLimit = 55;

timerSwitch() => Consumer(
      builder: (context, ref, _) {
        final timer = ref.watch(enableTimer);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              //Stops the algorithm search after 60 seconds
              Expanded(child: fontText('Time limit to 60 seconds ', 15)),
              Switch(
                value: timer,
                onChanged: (newValue) {
                  ref.read(enableTimer.notifier).state = newValue;
                  timeLimit = newValue ? 60 : 600;
                },
              ),
            ],
          ),
        );
      },
    );
