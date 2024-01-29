import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants.dart';
import 'segmented.dart';
import 'create_state.dart';
import 'segmented2.dart';
import 'sliders.dart';

class Create extends ConsumerStatefulWidget {
  const Create({super.key});

  @override
  ConsumerState<Create> createState() => _CreateState();
}

class _CreateState extends ConsumerState<Create> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      createReturn(ref);
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
              const SegmentedControl(),
              group(
                context,
                188,
                [slideK(), slideN(), slideTests()],
              ),
              group(
                context,
                132,
                [slideStop(), slideTime()],
              ),
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
  slideK() => SliderExample(
        currentValue: K.toDouble(),
        min: 1,
        max: 10,
        hint: 'Set K variable',
        iconData: Icons.expand_less_outlined,
        function: (value) {
          setState(() {
            K = value.toInt();
          });
        },
      );

  slideN() => SliderExample(
        currentValue: N.toDouble(),
        min: 1,
        max: 13,
        hint: 'Set N variable',
        iconData: Icons.local_parking_outlined,
        function: (value) {
          setState(() {
            N = value.toInt();
          });
        },
      );

  slideTests() => SliderExample(
        currentValue: numberOfTests.toDouble(),
        min: 1,
        max: 10,
        hint: 'Set Number of Tests',
        iconData: Icons.workspaces_outlined,
        function: (value) {
          setState(() {
            numberOfTests = value.toInt();
          });
        },
      );

  slideStop() => SliderExample(
        currentValue: stop.toDouble(),
        min: 1,
        max: 10,
        hint: 'Set Stop Size',
        iconData: Icons.remove_done_outlined,
        function: (value) {
          setState(() {
            stop = value.toInt();
          });
        },
      );

  slideTime() => SliderExample(
        currentValue: timeOut.toDouble(),
        min: 2,
        max: 240,
        hint: 'Set Time Size',
        iconData: Icons.timer,
        function: (value) {
          setState(() {
            timeOut = value.toInt();
          });
        },
      );
}
