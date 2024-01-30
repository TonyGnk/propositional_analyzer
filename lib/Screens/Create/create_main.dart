import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants.dart';
import 'create_helper.dart';
import 'segmented.dart';
import 'create_state.dart';
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
              const SizedBox(height: 4),
              const SegmentedControl(),
              group(
                context,
                183,
                [slideK(), slideN(), slideTests()],
              ),
              group(
                context,
                129,
                [slideStop(), slideTime()],
              ),
              const Expanded(flex: 1, child: SizedBox()),
              // modeText(context),
              //const SizedBox(height: 8),
              helpContainer(),
              analyzeContainer(),
            ],
          ),
        ),
      );

//
  slideK() => SliderExample(
        currentValue: K.toDouble(),
        min: 1,
        max: 10,
        hint: 'Variable K=$K',
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
        hint: 'Variable N=$N',
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
        max: 15,
        hint: 'Make $numberOfTests',
        extraHint: (numberOfTests == 1) ? 'test' : 'tests',
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
        //Σταμάτα όταν έχεις 3 συνεχόμενες αποτυχίες
        hint: 'Stop after $stop',
        extraHint: (stop == 1) ? 'failure' : 'failures',
        iconData: Icons.remove_done_outlined,
        function: (value) {
          setState(() {
            stop = value.toInt();
          });
        },
      );

  slideTime() => SliderExample(
        currentValue: timeOut.toDouble(),
        min: 1,
        max: 29,
        hint: 'Stop test after ${timeText[timeOut.toInt()]!}',
        iconData: Icons.timer,
        isTime: true,
        function: (value) {
          setState(() {
            timeOut = value.toInt();
          });
        },
      );
}
