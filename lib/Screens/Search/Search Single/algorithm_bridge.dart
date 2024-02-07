// ignore_for_file: avoid_print

import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../global_variables.dart';
import '../../../algorithms/depth_first.dart';
import '../../../algorithms/dpll.dart';
import '../../../algorithms/gready.dart';
import '../../../algorithms/new_value.dart';
import '../../../algorithms/walk_sat.dart';
import '../Search Share/track.dart';
import 'search_single_desktop.dart';

initializeData() {
  stopsPrimary = [];
  stopsSecondary = [];
  stop1 = 0.333;
  stop2 = 0.3331;

  double value = 1 / numberOfTests;
  for (int i = 1; i < numberOfTests; i++) {
    stopsPrimary.add(value * i);
    stopsSecondary.add(value * i + 0.001);
  }
  stopsPrimary.add(1);
  stopsSecondary.add(1.001);

  stop1 = stopsPrimary[0];
  stop2 = stopsSecondary[0];

  M = 1;
  spots1.clear();
  spots2.clear();
}

runAlgorithm() async {
  List<List<int>> problem = List.generate(M, (i) => List.filled(K, 0));
  problem = newProblem(problem);
  if (selected == 0) {
    return await hillClimbing(problem);
  } else if (selected == 1) {
    return await depthFirst(problem);
  } else if (selected == 2) {
    DPLL dpll = DPLL();
    Map<String, bool> model = {};
    Set<Set<int>> newProblem;
    newProblem = Set<Set<int>>.from(problem.map((e) => e.toSet()));
    //Call dpll.DPLL_Satisfiable(newProblem, model);
    //If does return a value until the time limit "timeOut" then return false
    try {
      bool result = await dpll.DPLL_Satisfiable(newProblem, model)
          .timeout(Duration(seconds: timeOut));
      return result
          ? const Search(win: true, time: 0)
          : const Search(win: false, time: 0);
    } on TimeoutException catch (_) {
      return const Search(win: false, time: 0);
    }
  } else if (selected == 3) {
    return await walkSat(problem);
  }
  problem.clear();
}

addTrack(List<TrackContainer> trackList, int j) {
  trackList.add(
    TrackContainer(
      child: Text(
        'Test $j with M=$M failed',
        style: const TextStyle(
          fontSize: 15,
          fontFamily: 'Play',
        ),
      ),
    ),
  );
  scrollDown();
}

addSpot(double M, double average, double averageTime) {
  M = M / N;
  M = double.parse(M.toStringAsFixed(1));

  spots1.add(FlSpot(M, average));
  spots2.add(FlSpot(M, averageTime));
}

class TrackContainer extends StatelessWidget {
  const TrackContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize - 2),
          color: Theme.of(context).unselectedWidgetColor,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        child: child,
      );
}

bool hover = false;
trackListContainer(BuildContext context, Widget child) => MouseRegion(
      onEnter: (event) {
        hover = true;
      },
      onExit: (event) {
        hover = false;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(cornerSize + 5),
          ),
          color: Theme.of(context).shadowColor,
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );

ScrollController controller = ScrollController();
scrollDown() async {
  if (!hover) {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 700),
      curve: Curves.fastOutSlowIn,
    );
  }
}
