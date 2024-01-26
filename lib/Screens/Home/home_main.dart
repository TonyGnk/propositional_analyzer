import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:propositional_analyzer/Screens/Home/home_fields.dart';

import '../screen_list.dart';
import 'mode_button_template.dart';
import 'home_state.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      homeReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => animatedColumn(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            welcomeToText,
            titleText(context),
            const SizedBox(height: 30),
            inPutField(context, kController, 'Set K variable',
                Icons.expand_less_outlined),
            inPutField(context, nController, 'Set N variable',
                Icons.local_parking_outlined),
            inPutField(context, sampleController, 'Set Sample Size',
                Icons.workspaces_outlined),
            inPutField(context, stopController, 'Set Stop Size',
                Icons.vertical_align_bottom_outlined),
            const Expanded(flex: 1, child: SizedBox()),
            modeText(context),
            const SizedBox(height: 16),
            rowOfButtons(),
            const SizedBox(height: 10),
          ],
        ),
      );
}

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
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );

modeText(BuildContext context) => Text(
      'How it works?',
      style: TextStyle(
        fontSize: 15,
        color: Theme.of(context).primaryColor,
      ),
      textAlign: TextAlign.center,
    );

rowOfButtons() => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: ModeButtons(
              label: 'Start',
              icon: Icons.troubleshoot_outlined,
              onTap: () => homeGo(ref, ScreenDestination.about),
            ),
          ),
        ],
      ),
    );
