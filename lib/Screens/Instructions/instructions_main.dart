import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global_variables.dart';
import '../../UI/Components/filled_button.dart';
import '../Create/Create Share/Segmented/segmented_multi.dart';
import '../Create/Create Share/analyze_button.dart';
import '../Create/Create Share/create_helper.dart';
import '../Create/Create Share/instructions_button.dart';
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
  int index = 1;
  //List?<Widget> page = null;
  List<Widget> Function(BuildContext context) page = instructionsText[1]!;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      instructionsReturn(ref);
    });
    opacity = 1;
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    return animatedColumn(
      // isDesktop ? desktopView() :
      mobileView(context),
    );
  }

  updatePage(int newIndex) async {
    setState(() {
      opacity = 0;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      index = newIndex;
      page = instructionsText[index]!;
      opacity = 1;
    });
  }

  mobileView(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: movingPart(context)),
            buttonRow(context),
          ],
        ),
      );

  movingPart(BuildContext context) => AnimatedOpacity(
        opacity: opacity,
        duration: basicDuration,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: icon(context),
            ),
            Expanded(child: text(context)),
          ],
        ),
      );

  icon(BuildContext context) => SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                page(context)[0],
              ],
            ),
          ],
        ),
      );

  text(BuildContext context) => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: page(context)[1],
                ),
                const SizedBox(height: 17),
                viewOtherText(context),
              ],
            ),
          ),
        ],
      );

  viewOtherText(BuildContext context) => Expanded(
        child: ListView.builder(
          itemCount: page(context).length - 2,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
            child: page(context)[index + 2],
          ),
        ),
      );

  buttonRow(BuildContext context) => Row(
        children: [
          Expanded(
            child: ExamplesButton(
              label: 'Previous',
              icon: Icons.arrow_back,
              onTap: () {
                updatePage(1);
              },
            ),
          ),
          Expanded(
            child: MyFilledButton(
              label: 'Next',
              icon: Icons.arrow_forward,
              onTap: () {
                updatePage(2);
              },
            ),
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
