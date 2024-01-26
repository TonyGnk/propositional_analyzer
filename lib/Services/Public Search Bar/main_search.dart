import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import 'check_box_search.dart';
import 'closed_search.dart';
import 'sliders_and_options_bf.dart';

final makeContainerTallerProvider = StateProvider<bool>((ref) => false);
final showTheExtraOptionsProvider = StateProvider<bool>((ref) => false);

publicSearchBar(bool compareMode) => Consumer(builder: (context, ref, _) {
      final moreOptions = ref.watch(makeContainerTallerProvider);
      final stepMode = ref.watch(stepModeProvider);
      return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        height: findHeight(moreOptions, stepMode, compareMode),
        padding: const EdgeInsets.all(4),
        decoration: decoration(context),
        child: mainSearchBar(compareMode),
      );
    });

findHeight(bool moreOptions, bool stepMode, bool compareMode) {
  if (stepMode) return 106.0;
  if (compareMode && moreOptions) return 215.0;
  if (moreOptions) return 331.0;
  return 50.0;
}

decoration(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(cornerSize),
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      border: Border.all(
        width: 1,
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
    );

mainSearchBar(bool compareMode) => Column(
      children: [closedSearch(compareMode), extraOptionsBuilder(compareMode)],
    );

Widget extraOptionsBuilder(bool compareMode) => Consumer(
      builder: (context, ref, _) {
        final moreOptions2 = ref.watch(showTheExtraOptionsProvider);
        return AnimatedOpacity(
          opacity: moreOptions2 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          child: moreOptions2 ? extraOptions(compareMode) : const SizedBox(),
        );
      },
    );

Widget extraOptions(bool compareMode) => Column(
      children: [
        const SizedBox(height: 12),
        !compareMode ? segmentedSpeed() : const SizedBox(),
        !compareMode ? const SizedBox(height: 8) : const SizedBox(),
        rowOfChecks(),
        const SizedBox(height: 2),
        customSwitch(),
        timerSwitch(),
        !compareMode ? stepRow() : const SizedBox(),
      ],
    );

void resetControllers(WidgetRef ref) {
  inputController.clear();
  targetController.clear();
}

stepRow() => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: () => ((inputController.text != '') &&
                      (targetController.text != ''))
                  ? {}
                  : null,
              icon: const Icon(Icons.play_circle_filled_outlined),
              label: fontText('Run the algorithm in steps', 14),
            ),
          ),
        ],
      ),
    );

fontText(String text, double size) => Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Play',
      ),
    );
