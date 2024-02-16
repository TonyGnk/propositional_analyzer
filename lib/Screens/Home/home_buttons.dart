import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global_variables.dart';
import '../../UI/Adaptive Folder/synthesizer.dart';
import '../Charts/Charts Multi/save_icon.dart';
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
);

const helpContainer = ButtonTemplate(
  title: 'Collection',
  slogan: 'Your saved analysis',
  icon: Icons.subscriptions_outlined,
  screenDestination: ScreenDestination.collection,
);

class ButtonTemplate extends ConsumerStatefulWidget {
  const ButtonTemplate({
    required this.title,
    required this.slogan,
    required this.icon,
    this.screenDestination,
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
  final ScreenDestination? screenDestination;

  @override
  ConsumerState<ButtonTemplate> createState() => _ButtonTemplateState();
}

class _ButtonTemplateState extends ConsumerState<ButtonTemplate> {
  //late scale 1.0
  late double scale = 1.0;
  int elev = 3;

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
              elev = 1;
            });
          },
          onExit: (event) {
            setState(() {
              scale = 1.0;
              elev = 3;
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
                          goTo(ref, ScreenDestination.chartSingle)
                        }
                      : {
                          screenStack.add(ScreenDestination.createMulti),
                          goTo(ref, ScreenDestination.chartMulti)
                        }
                  : goTo(ref, widget.screenDestination!);
            },
            child: AnimatedScale(
              scale: scale,
              duration: basicDuration,
              child: container(),
            ),
          ),
        ),
      );

  container() => Consumer(builder: (context, ref, _) {
        final isDesktop = ref.watch(isDesktopProvider);
        //isDesktop or mediaQuery.size.width > 600
        return (MediaQuery.of(context).size.width > 600)
            ? card(true)
            : card(false);
      });

  card(bool isDesktop) => Card(
        elevation: isDesktop ? 0 : elev.toDouble(),
        child: Container(
          decoration: BoxDecoration(
            border:
                (isDesktop && Theme.of(context).brightness == Brightness.light)
                    ? Border.all(
                        color: Theme.of(context).splashColor,
                        width: 2,
                      )
                    : Border.all(
                        color: Theme.of(context)
                            .menuButtonTheme
                            .style!
                            .foregroundColor!
                            .resolve({})!,
                      ),
            borderRadius: BorderRadius.circular(cornerSize),
          ),
          padding: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          child: row(),
        ),
      );

  row() => Row(
        children: [
          iconColumn(),
          const SizedBox(width: 8),
          Expanded(
            child: textColumn(context),
          ),
        ],
      );

  iconColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      );

  textColumn(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            widget.slogan,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      );
}
