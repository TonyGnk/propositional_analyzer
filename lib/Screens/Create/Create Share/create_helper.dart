import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screen_list.dart';
import 'analyze_button.dart';
import 'instructions_button.dart';

const String hill = 'Hill Climbing';
const String depth = 'Depth First Search';
const String dpll = 'DPLL';
const String walksat = 'WalkSAT';

analyzeContainer([bool multi = false]) => Consumer(
      builder: (context, ref, _) => AnalyzeButton(
        label: 'Analyze',
        icon: Icons.troubleshoot_outlined,
        currentPrimary: Theme.of(context).colorScheme.primary,
        onTap: () {
          multi
              ? goTo(ref, ScreenDestination.searchMulti)
              : goTo(ref, ScreenDestination.searchSingle);
        },
      ),
    );

examplesContainer() => Consumer(
      builder: (context, ref, _) => ExamplesButton(
        label: 'Examples',
        icon: Icons.subscriptions_outlined,
        onTap: () {
          //goTo(ref, ScreenDestination.result);
        },
      ),
    );
