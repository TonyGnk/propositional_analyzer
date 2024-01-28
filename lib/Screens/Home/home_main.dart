import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_fields.dart';

import 'home_state.dart';
import 'segmented.dart';
import 'segmented2.dart';

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
              const SegmentedControl(),
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
}
