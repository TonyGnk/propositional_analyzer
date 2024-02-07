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
            helpContainer(),
            analyzeContainer(),
          ],
        ),
      );

  updateK(int value) => setState(() => K = value.toInt());
  updateN(int value) => setState(() => N = value.toInt());
  updateTests(int value) => setState(() => numberOfTests = value.toInt());
  updateStop(int value) => setState(() => stop = value.toInt());
  updateTime(int value) => setState(() => timeOut = value.toInt());

//
  analyzeContainer() => Consumer(
        builder: (context, ref, _) => AnalyzeButton(
          label: 'Analyze',
          icon: Icons.troubleshoot_outlined,
          onTap: () {
            goTo(ref, ScreenDestination.searchMulti);
          },
        ),
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
