import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../screen_list.dart';
import 'home_fields.dart';
import 'home_state.dart';
import 'mode_button_template.dart';

const String hill = 'Hill Climbing';
const String depth = 'Depth First Search';
const String dpll = 'DPLL';
const String walksat = 'WalkSAT';

const welcomeToText = Text(
  'Welcome to',
  style: TextStyle(
    fontSize: 27,
    fontFamily: 'Play',
  ),
  textAlign: TextAlign.right,
);

titleText(BuildContext context) => Text(
      'Propositional Analyzer',
      style: TextStyle(
          fontSize: 34,
          color: Theme.of(context).canvasColor,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );

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

createButton(BuildContext context) => Consumer(
      builder: (context, ref, _) => FilledButton.icon(
        icon: Icon(
          Icons.create_outlined,
          color: Theme.of(context).canvasColor,
        ),
        onPressed: () => homeGo(ref, ScreenDestination.create),
        label: Text(
          'Create',
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).canvasColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

loadButton(BuildContext context) => Consumer(
      builder: (context, ref, _) => FilledButton.icon(
        icon: Icon(
          Icons.create_outlined,
          color: Theme.of(context).canvasColor,
        ),
        onPressed: () {},
        label: Text(
          'Load',
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).canvasColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

rowOfButtons() => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: ModeButtons(
              label: 'Start',
              icon: Icons.troubleshoot_outlined,
              onTap: () {
                //Check if kController is empty and if not then assign the value to k parse to int before
                if (kController.text.isNotEmpty) {
                  K = int.parse(kController.text);
                } else {
                  K = 6;
                }
                //Check if nController is empty and if not then assign the value to n parse to int before
                if (nController.text.isNotEmpty) {
                  N = int.parse(nController.text);
                } else {
                  N = 12;
                }
                //sample
                if (sampleController.text.isNotEmpty) {
                  numberOfTests = int.parse(sampleController.text);
                } else {
                  numberOfTests = 3;
                }
                homeGo(ref, ScreenDestination.result);
              },
            ),
          ),
        ],
      ),
    );
