import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global_variables.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../Charts/Charts Single/save_icon.dart';
import '../screen_list.dart';

//Create a new analysis with one Algorithm
const newCreateButton = ButtonTemplate(
  title: 'New', //Create a new analysis, set variables, n,k, etc
  slogan: 'Create a new analysis',
  icon: Icons.show_chart_outlined,
  screenDestination: ScreenDestination.createSingle,
);

//Create a new analysis with multiple Algorithms/Compare each other
const newCreateMultiButton = ButtonTemplate(
  //Create a new multiple analysis with multiple Algorithms/Compare each other
  title: 'New Multiple',
  slogan: 'Create a new multiple analysis',
  icon: Icons.stacked_line_chart_outlined,
  screenDestination: ScreenDestination.createMulti,
);

const newLoadButton = ButtonTemplate(
  title: 'Load',
  slogan: 'Now Available!',
  icon: Icons.file_upload_outlined,
  isLoading: true,
  screenDestination: ScreenDestination.chartSingle,
);

class ButtonTemplate extends ConsumerStatefulWidget {
  const ButtonTemplate({
    required this.title,
    required this.slogan,
    required this.icon,
    required this.screenDestination,
    this.isLoading = false,
    super.key,
  });

  final bool isLoading;

  //Label
  final String title;

  //Slogan
  final String slogan;

  //Icon of the button
  final IconData icon;

  //ScreenDestination
  final ScreenDestination screenDestination;

  @override
  ConsumerState<ButtonTemplate> createState() => _ButtonTemplateState();
}

class _ButtonTemplateState extends ConsumerState<ButtonTemplate> {
  //late scale 1.0
  late double scale = 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => MouseRegion(
          onEnter: (event) {
            setState(() {
              scale = 0.97;
            });
          },
          onExit: (event) {
            setState(() {
              scale = 1.0;
            });
          },
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async {
              setState(() {});
              (widget.isLoading)
                  ? (await loadAnalysis())
                      ? {
                          screenStack.add(ScreenDestination.createSingle),
                          goTo(ref, widget.screenDestination)
                        }
                      : null
                  : goTo(ref, widget.screenDestination);
            },
            child: AnimatedScale(
              scale: scale,
              duration: basicDuration,
              child: container(),
            ),
          ),
        ),
      );

  container() => Container(
        //height: 130,
        //constraints max width 400 min 200
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(cornerSize),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 11),
        clipBehavior: Clip.antiAlias,
        child: row(),
      );

  row() => Row(
        children: [
          iconColumn(),
          const SizedBox(width: 8),
          Expanded(
            child: textColumn(),
          ),
        ],
      );

  iconColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 48,
            color: Theme.of(context).canvasColor,
          ),
        ],
      );

  textColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 23,
              fontFamily: 'Play',
            ),
          ),
          Text(
            widget.slogan,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Play',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ],
      );
}
