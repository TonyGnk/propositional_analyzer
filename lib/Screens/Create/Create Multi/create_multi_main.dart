import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global_variables.dart';
import '../../screen_list.dart';
import '../Create Share/Segmented/segmented_multi.dart';
import '../Create Share/analyze_button.dart';
import '../Create Share/create_helper.dart';
import '../Create Share/slide_item.dart';
import '../Create Share/slide_item_list.dart';
import 'create_multi_state.dart';
import '../../shared.dart';

class CreateMulti extends ConsumerStatefulWidget {
  const CreateMulti({super.key});

  @override
  ConsumerState<CreateMulti> createState() => _CreateState();
}

class _CreateState extends ConsumerState<CreateMulti> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      createMultiReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    return animatedColumn(
      isDesktop ? desktopView() : mobileView(),
    );
  }

  desktopView() => desktopFrame(
        context,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const SegmentedControlMulti(),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: group(
                    context,
                    185,
                    [slideK(updateK), slideN(updateN), slideTests(updateTests)],
                  ),
                ),
                Expanded(
                  child: group(
                    context,
                    185,
                    [
                      const Expanded(child: SizedBox()),
                      slideStop(updateStop),
                      const Expanded(child: SizedBox()),
                      slideTime(updateTime),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 173,
                  child: examplesContainer(),
                ),
                SizedBox(
                  width: 172,
                  child: analyzeContainer(true),
                ),
              ],
            ),
          ],
        ),
        800,
        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      );

  mobileView() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 4),
            const SegmentedControlMulti(),
            group(context, 183, [
              slideK(updateK),
              slideN(updateN),
              slideTests(updateTests),
            ]),
            group(context, 129, [
              slideStop(updateStop),
              slideTime(updateTime),
            ]),
            const Expanded(flex: 1, child: SizedBox()),
            buttonRow(),
          ],
        ),
      );

  buttonRow() => Row(
        children: [
          Expanded(child: examplesContainer()),
          const SizedBox(width: 5),
          Expanded(child: analyzeContainer(true)),
        ],
      );

  updateK(int value) => setState(() {
        K = value.toInt();
        if (K > N) N = K;
      });
  updateN(int value) => setState(() {
        N = value.toInt();
        if (N < K) K = N;
      });
  updateTests(int value) => setState(() => numberOfTests = value.toInt());
  updateStop(int value) => setState(() => stop = value.toInt());
  updateTime(int value) => setState(() => timeOut = value.toInt());
}
