import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global_variables.dart';
import '../Create/Create Share/Segmented/segmented_multi.dart';
import '../Create/Create Share/analyze_button.dart';
import '../Create/Create Share/create_helper.dart';
import '../Create/Create Share/slide_item.dart';
import '../Create/Create Share/slide_item_list.dart';
import '../screen_list.dart';
import 'instructions_state.dart';
import 'instructions_strings.dart';

class Instructions extends ConsumerStatefulWidget {
  const Instructions({super.key});

  @override
  ConsumerState<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends ConsumerState<Instructions> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      instructionsReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    return animatedColumn(
      // isDesktop ? desktopView() :
      mobileView(),
    );
  }

  mobileView() => Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 4),
            const Text(stringAContentGeek),
            const Text(strToExampleEl),
            const Expanded(
              child: SizedBox(),
            ),
            buttonRow(context),
          ],
        ),
      );

  buttonRow(BuildContext context) => Row(
        children: [
          //ElevatedButton Back
          TextButton(
            onPressed: () {},
            child: const Text('Back'),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          circleProgress(),
          const Expanded(
            child: SizedBox(),
          ),
          //ElevatedButton Next
          AnalyzeButton(
            label: 'Next',
            icon: Icons.arrow_forward,
            onTap: () {},
            currentPrimary: Theme.of(context).colorScheme.primary,
          ),
        ],
      );

  circleProgress() => Row(
        children: [
          //Circle 1 Bold
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          //Circle 2
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          //Circle 3
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ],
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
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 18),
          width: 800,
          child: column,
        ),
      ],
    );
