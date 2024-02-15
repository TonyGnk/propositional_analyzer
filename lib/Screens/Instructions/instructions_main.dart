import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global_variables.dart';
import '../../UI/Components/filled_button.dart';
import '../Create/Create Share/instructions_button.dart';
import '../screen_list.dart';
import '../shared.dart';
import 'instructions_state.dart';
import 'instructions_strings.dart';

//StateProvider
final instructionsIndex = StateProvider<int>((ref) => 1);
final instructionsLanguageIsEnglish = StateProvider<bool>((ref) => true);

class Instructions extends ConsumerStatefulWidget {
  const Instructions({super.key});

  @override
  ConsumerState<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends ConsumerState<Instructions> {
  List<Widget> Function(BuildContext context) page = instructionsText[1]!;

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
      isDesktop ? desktopView(context) : mobileView(context),
    );
  }

  desktopView(BuildContext context) => Consumer(builder: (context, ref, _) {
        final pageIndex = ref.watch(instructionsIndex);
        final isEnglish = ref.watch(instructionsLanguageIsEnglish);
        return desktopFrame(
            context,
            Column(
              children: [
                Expanded(
                  child: movingPart(context, ref, pageIndex, isEnglish),
                ),
                const SizedBox(height: 6),
                buttonRowDesktop(context, ref, pageIndex),
              ],
            ),
            900,
            const EdgeInsets.all(10));
      });

  mobileView(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer(builder: (context, ref, _) {
          final pageIndex = ref.watch(instructionsIndex);
          final isEnglish = ref.watch(instructionsLanguageIsEnglish);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: movingPart(context, ref, pageIndex, isEnglish)),
              const SizedBox(height: 6),
              buttonRow(context, ref, pageIndex),
            ],
          );
        }),
      );

  movingPart(
    BuildContext context,
    WidgetRef ref,
    int pageIndex,
    bool isEnglish,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: icon(context, pageIndex, isEnglish),
          ),
          Expanded(child: text(context, ref, pageIndex, isEnglish)),
        ],
      );

  icon(BuildContext context, int pageIndex, bool isEnglish) => SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [instructionsMaps[isEnglish]?[pageIndex](context)[0]],
            ),
          ],
        ),
      );

  text(BuildContext context, WidgetRef ref, int pageIndex, bool isEnglish) =>
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: instructionsMaps[isEnglish]?[pageIndex](context)[1],
                ),
                const SizedBox(height: 17),
                viewOtherText(context, ref, pageIndex, isEnglish),
              ],
            ),
          ),
        ],
      );

  viewOtherText(
          BuildContext context, WidgetRef ref, int pageIndex, bool isEnglish) =>
      Expanded(
        child: ListView.builder(
          itemCount:
              instructionsMaps[isEnglish]?[pageIndex](context).length - 2,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
            child: instructionsMaps[isEnglish]?[pageIndex](context)[index + 2],
          ),
        ),
      );

  buttonRow(BuildContext context, WidgetRef ref, int index) => Row(
        children: [
          Expanded(
            child: (index > 1)
                ? ExamplesButton(
                    label: 'Previous',
                    icon: Icons.arrow_back,
                    onTap: () {
                      ref.read(instructionsIndex.notifier).state =
                          ref.read(instructionsIndex.notifier).state - 1;
                    },
                  )
                : const SizedBox(),
          ),
          Expanded(
            child: (index < 3)
                ? MyFilledButton(
                    label: 'Next',
                    icon: Icons.arrow_forward,
                    onTap: () {
                      ref.read(instructionsIndex.notifier).state =
                          ref.read(instructionsIndex.notifier).state + 1;
                    },
                  )
                : MyFilledButton(
                    label: 'Exit',
                    icon: Icons.exit_to_app,
                    onTap: () {
                      goBack(ref);
                    },
                  ),
          ),
        ],
      );

  buttonRowDesktop(BuildContext context, WidgetRef ref, int index) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          (index > 1)
              ? ExamplesButton(
                  label: 'Previous',
                  icon: Icons.arrow_back,
                  onTap: () {
                    ref.read(instructionsIndex.notifier).state =
                        ref.read(instructionsIndex.notifier).state - 1;
                  },
                )
              : const SizedBox(),
          (index < 3)
              ? MyFilledButton(
                  label: 'Next',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    ref.read(instructionsIndex.notifier).state =
                        ref.read(instructionsIndex.notifier).state + 1;
                  },
                )
              : MyFilledButton(
                  label: 'Exit',
                  icon: Icons.exit_to_app,
                  onTap: () {
                    goBack(ref);
                  },
                ),
        ],
      );
}

// desktopFrame(BuildContext context, Column column) => Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           constraints: const BoxConstraints(maxHeight: 470),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Theme.of(context).dividerColor),
//             color: Theme.of(context).dividerColor.withOpacity(0.1),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//           margin: const EdgeInsets.symmetric(horizontal: 18),
//           width: 800,
//           child: column,
//         ),
//       ],
//     );
