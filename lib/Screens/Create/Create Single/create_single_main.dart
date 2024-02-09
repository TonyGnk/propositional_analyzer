import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
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
            const DesktopSegmented(),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: group(
                    context,
                    183,
                    [slideK(updateK), slideN(updateN), slideTests(updateTests)],
                  ),
                ),
                Expanded(
                  child: group(
                    context,
                    183,
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
          const SizedBox(height: 4),
          const SegmentedControl(),
          group(
            context,
            183,
            [slideK(updateK), slideN(updateN), slideTests(updateTests)],
          ),
          group(
            context,
            129,
            [slideStop(updateStop), slideTime(updateTime)],
          ),
          const Expanded(flex: 1, child: SizedBox()),
          examplesContainer(),
          analyzeContainer(),
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

//
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
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 18),
          width: 800,
          child: column,
        ),
      ],
    );
