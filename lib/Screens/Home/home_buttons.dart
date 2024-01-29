import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/constants.dart';
import '../screen_list.dart';
import 'home_state.dart';

createButton(BuildContext context) => Consumer(
      builder: (context, ref, _) => FilledButton.icon(
        icon: Icon(
          Icons.create_outlined,
          color: Theme.of(context).canvasColor,
        ),
        onPressed: () => homeGo(ref, ScreenDestination.create),
        label: Text(
          'Create',
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).canvasColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

loadButton(BuildContext context) => Consumer(
      builder: (context, ref, _) => FilledButton.icon(
        icon: Icon(
          Icons.create_outlined,
          color: Theme.of(context).canvasColor,
        ),
        onPressed: () {},
        label: Text(
          'Load',
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).canvasColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

newCreateButton() => const ButtonTemplate(
      //Create your simulation with Propositional analyzer. Set your variables and your propositions and see the result for a large sample of tests.
      title: 'Create',
      slogan: 'Create your simulation!',
      //simulater icon
      icon: Icons.science_outlined,
      screenDestination: ScreenDestination.create,
    );

//newLoadButton
//Load your existing simulation and see the results in charts
newLoadButton() => const ButtonTemplate(
      //Load your existing simulation and see the results in charts
      title: 'Load',
      slogan: 'Load your simulation!',
      icon: Icons.file_upload_outlined,
      screenDestination: ScreenDestination.chart,
    );

class ButtonTemplate extends ConsumerStatefulWidget {
  const ButtonTemplate({
    required this.title,
    required this.slogan,
    required this.icon,
    required this.screenDestination,
    super.key,
  });

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
              scale = 0.96;
            });
          },
          onExit: (event) {
            setState(() {
              scale = 1.0;
            });
          },
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              setState(() {});
              homeGo(ref, widget.screenDestination);
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
          // Text(
          //   widget.description,
          //   style: const TextStyle(
          //     fontSize: 18,
          //     fontFamily: 'Play',
          //   ),
          //   softWrap: true,
          //   overflow: TextOverflow.fade,
          // ),
        ],
      );
}
