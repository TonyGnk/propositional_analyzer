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
          color: Theme.of(context).navigationDrawerTheme.backgroundColor,
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(cornerSize),
              ),
              border: (Theme.of(context).brightness == Brightness.dark)
                  ? Border.all(
                      width: 2,
                      color: Theme.of(context)
                          .menuButtonTheme
                          .style!
                          .foregroundColor!
                          .resolve({})!,
                    )
                  : null,
            ),
            padding: const EdgeInsets.symmetric(vertical: 11), //14
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
        padding: const EdgeInsets.only(left: 11, right: 11, bottom: 0),
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cornerSize),
              border: (Theme.of(context).brightness == Brightness.light)
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
            ),
            padding: const EdgeInsets.all(10),
            child: child,
          ),
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
