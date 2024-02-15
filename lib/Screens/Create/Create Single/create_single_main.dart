import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../screen_list.dart';
import '../../shared.dart';
import '../Create Share/create_helper.dart';
import '../Create Share/Segmented/desktop_segmented.dart';
import '../Create Share/Segmented/segmented.dart';
import '../Create Share/slide_item.dart';
import '../Create Share/slide_item_list.dart';
import 'create_single_state.dart';

class CreateSingle extends ConsumerStatefulWidget {
  const CreateSingle({super.key});

  @override
  ConsumerState<CreateSingle> createState() => _CreateSingleState();
}

class _CreateSingleState extends ConsumerState<CreateSingle> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      createSingleReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
//     return PopScope(
//   onPopInvoked: (value) => goBack(ref),
//   child: MaterialApp(...),
// );

    return animatedColumn(
      isDesktop ? desktopView() : mobileView(),
    );
  }

  mobileView() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        child: createColumn(),
      );

  desktopView() => desktopFrame(
        context,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const DesktopSegmented(),
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
          //const SizedBox(height: 2),
          group(
            context,
            183,
            [slideK(updateK), slideN(updateN), slideTests(updateTests)],
          ),
          const SizedBox(height: 5),
          group(
            context,
            129,
            [slideStop(updateStop), slideTime(updateTime)],
          ),
          const SizedBox(height: 5),
          const SegmentedControl(),
          const Expanded(flex: 1, child: SizedBox()),
          //examplesContainer(),
          buttonRow(),
          //analyzeContainer(),
        ],
      );

  buttonRow() => Row(
        children: [
          Expanded(child: examplesContainer()),
          const SizedBox(width: 5),
          Expanded(child: analyzeContainer()),
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
