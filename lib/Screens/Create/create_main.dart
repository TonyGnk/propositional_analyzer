import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Services/global_variables.dart';
import 'create_helper.dart';
import 'desktop_segmented.dart';
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
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    return animatedColumn(
      isDesktop ? desktopView() : mobileView(),
    );
  }

  mobileView() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: createColumn(),
      );

  desktopView() => desktopFrame(
        context,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: group(
                    context,
                    183,
                    [slideK(), slideN(), slideTests()],
                  ),
                ),
                Expanded(
                  child: group(
                    context,
                    183,
                    [
                      const Expanded(child: SizedBox()),
                      slideStop(),
                      const Expanded(child: SizedBox()),
                      slideTime(),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const DesktopSegmented(),
            const Expanded(flex: 1, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 173,
                  child: helpContainer(),
                ),
                SizedBox(
                  width: 172,
                  child: analyzeContainer(),
                ),
              ],
            ),
          ],
        ),
      );

  createColumn() => Column(
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
          helpContainer(),
          analyzeContainer(),
        ],
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

desktopFrame(BuildContext context, Column column) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 470),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).dividerColor),
            color: Theme.of(context).dividerColor.withOpacity(0.1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: 800,
          child: column,
        ),
      ],
    );
