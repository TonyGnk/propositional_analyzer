import 'package:flutter/material.dart';

import '../../../global_variables.dart';

bool hover = false;
trackListContainer(BuildContext context, Widget child) => MouseRegion(
      onEnter: (event) {
        hover = true;
      },
      onExit: (event) {
        hover = false;
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          // color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 3,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(cornerSize),
              ),
              //color: Theme.of(context).shadowColor,
              // border: Border.all(
              //   color: Theme.of(context)
              //       .menuButtonTheme
              //       .style!
              //       .foregroundColor!
              //       .resolve({})!,
              // ),
            ),
            padding: const EdgeInsets.only(top: 11), //14
            clipBehavior: Clip.antiAlias,
            child: child,
          ),
        ),
      ),
    );

class TrackContainer extends StatelessWidget {
  const TrackContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 11, right: 11, bottom: 11),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(cornerSize),
            //color: Theme.of(context).unselectedWidgetColor,
            // border: Border(
            //   bottom: BorderSide(
            //     color: Theme.of(context).dividerColor,
            //     width: 1,
            //   ),
            // ),
          ),
          padding: const EdgeInsets.all(10),
          child: child,
        ),
      );
}

class Search {
  const Search({
    required this.win,
    this.time = 0,
  });
  final bool win;
  final int time;
}
