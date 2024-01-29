import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screen_list.dart';
import 'analyze_button.dart';

const String hill = 'Hill Climbing';
const String depth = 'Depth First Search';
const String dpll = 'DPLL';
const String walksat = 'WalkSAT';

modeText(BuildContext context) => TextButton.icon(
      icon: Icon(
        Icons.help_outline_outlined,
        color: Theme.of(context).canvasColor,
      ),
      onPressed: () {},
      label: Text(
        'How it works?',
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).canvasColor,
        ),
        textAlign: TextAlign.center,
      ),
    );

analyzeContainer() => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: AnalyzeButton(
              label: 'Instructions',
              icon: Icons.info_outline,
              onTap: () {
                goTo(ref, ScreenDestination.result);
              },
            ),
          ),
          Expanded(
            child: AnalyzeButton(
              label: 'Analyze',
              icon: Icons.troubleshoot_outlined,
              onTap: () {
                goTo(ref, ScreenDestination.result);
              },
            ),
          ),
        ],
      ),
    );
