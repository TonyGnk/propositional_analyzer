import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 3, child: SizedBox()),
            welcomeToText,
            titleText,
            const Expanded(flex: 3, child: SizedBox()),
            modeText,
            const SizedBox(height: 16),
            rowOfButtons(),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      );
}

const welcomeToText = Text(
  'Welcome to',
  style: TextStyle(
    fontSize: 29,
    fontFamily: 'Play',
  ),
  textAlign: TextAlign.left,
);

const titleText = Text(
  'Node Odyssey',
  style: TextStyle(
      fontSize: 36,
      color: Color.fromRGBO(32, 102, 224, 0.9),
      fontWeight: FontWeight.bold),
  textAlign: TextAlign.left,
);

const modeText = Text(
  'Select the mode you want to use:',
  style: TextStyle(
    fontSize: 15,
    fontFamily: 'Play',
  ),
  textAlign: TextAlign.left,
);

rowOfButtons() => Consumer(
      builder: (context, ref, _) => Row(
        children: [
          Expanded(
            child: ModeButtons(
              label: 'Terminal',
              icon: Icons.terminal,
              onTap: () => homeGo(ref, ScreenDestination.about),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ModeButtons(
              label: 'GUI',
              icon: Icons.desktop_windows_outlined,
              onTap: () => homeGo(ref, ScreenDestination.about),
            ),
          ),
        ],
      ),
    );
