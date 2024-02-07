import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screen_list.dart';
import 'analyze_button.dart';
import 'instructions_button.dart';

const String hill = 'Hill Climbing';
const String depth = 'Depth First Search';
const String dpll = 'DPLL';
const String walksat = 'WalkSAT';

analyzeContainer() => Consumer(
      builder: (context, ref, _) => AnalyzeButton(
        label: 'Analyze',
        icon: Icons.troubleshoot_outlined,
        onTap: () {
          goTo(ref, ScreenDestination.searchSingle);
        },
      ),
    );

helpContainer() => Consumer(
      builder: (context, ref, _) => InstructionsButton(
        label: 'Instructions',
        icon: Icons.help_outline_outlined,
        onTap: () {
          //goTo(ref, ScreenDestination.result);
        },
      ),
    );
