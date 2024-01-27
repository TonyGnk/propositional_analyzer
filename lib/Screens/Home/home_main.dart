import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Services/constants.dart';
import '../../function.dart';
import 'home_fields.dart';

import '../screen_list.dart';
import 'mode_button_template.dart';
import 'home_state.dart';
import 'segmented.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  double dropdownHeight = 40;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      homeReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: animatedColumn(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              welcomeToText,
              titleText(context),
              const SizedBox(height: 30),
              //segmentedRunner2(),
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
        ),
      );

//

//

  segmentedRunner2() {
    return AnimatedContainer(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: dropdownHeight,
      child: row(),
    );
  }

  row() => Row(
        children: [
          Expanded(child: SizedBox()),
          //Show more button icon
          IconButton(
            icon: const Icon(Icons.expand_more_outlined),
            onPressed: () {
              setState(() {
                if (dropdownHeight == 40) {
                  dropdownHeight = 200;
                } else {
                  dropdownHeight = 40;
                }
              });
            },
          ),
        ],
      );

//

//
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

rowOfButtons() => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: ModeButtons(
              label: 'Start',
              icon: Icons.troubleshoot_outlined,
              onTap: () => homeGo(ref, ScreenDestination.result),
            ),
          ),
        ],
      ),
    );
