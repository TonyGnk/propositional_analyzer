import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../global_variables.dart';
import '../../../algorithms/depth_first.dart';
import '../../../algorithms/dpll.dart';
import '../../../algorithms/gready.dart';
import '../../../algorithms/new_value.dart';
import '../../../algorithms/walk_sat.dart';
import 'track.dart';

List<double> stopsPrimary = [];
List<double> stopsSecondary = [];
double stop1 = 0.333;
double stop2 = 0.3331;

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
  List<List<int>> problem = newProblem();
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

//Map with Algorithm type and the function to call
Map<Algorithms, Function> algorithmMap = {
  Algorithms.hillClimbing: hillClimbing,
  Algorithms.depthFirst: depthFirst,
  Algorithms.walkSat: walkSat,
};

// runAlgorithmNew(Algorithms type) async {
//   return
// }

addTrack(List<TrackContainer> trackList, int j, [String type = '']) {
  trackList.add(
    TrackContainer(
      child: Text(
        '$type Test $j with M=$M failed',
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

//_____________________________________________________________
List<Algorithms> runningList = [];
checkWhichRunning() {
  hillHasMore = true;
  depthHasMore = true;
  dpllHasMore = true;
  walkHasMore = true;
  runningList.clear();
  if (selectedHill) runningList.add(Algorithms.hillClimbing);
  if (selectedDepth) runningList.add(Algorithms.depthFirst);
  if (selectedWalk) runningList.add(Algorithms.walkSat);
}

bool hillHasMore = true;
bool depthHasMore = true;
bool dpllHasMore = true;
bool walkHasMore = true;

bool findHasMore(Algorithms type) {
  if (type == Algorithms.hillClimbing) return hillHasMore;
  if (type == Algorithms.depthFirst) return depthHasMore;
  if (type == Algorithms.dpll) return dpllHasMore;
  if (type == Algorithms.walkSat) return walkHasMore;
  return false;
}

bool setHasMore(Algorithms type, bool value) {
  if (type == Algorithms.hillClimbing) hillHasMore = value;
  if (type == Algorithms.depthFirst) depthHasMore = value;
  if (type == Algorithms.dpll) dpllHasMore = value;
  if (type == Algorithms.walkSat) walkHasMore = value;
  return value;
}

int countOfFalseHasMore() {
  int count = 0;
  if (!hillHasMore) count++;
  if (!depthHasMore) count++;
  if (!dpllHasMore) count++;
  if (!walkHasMore) count++;
  return count;
}

List<bool> hillStopList = [];
List<bool> depthStopList = [];
List<bool> dpllStopList = [];
List<bool> walkStopList = [];

//if sampleSum==0 add true to the right stopList else clear it
addStopList(int sampleSum, Algorithms type) {
  if (sampleSum == 0) {
    if (type == Algorithms.hillClimbing) hillStopList.add(true);
    if (type == Algorithms.depthFirst) depthStopList.add(true);
    if (type == Algorithms.dpll) dpllStopList.add(true);
    if (type == Algorithms.walkSat) walkStopList.add(true);
  } else {
    if (type == Algorithms.hillClimbing) hillStopList.clear();
    if (type == Algorithms.depthFirst) depthStopList.clear();
    if (type == Algorithms.dpll) dpllStopList.clear();
    if (type == Algorithms.walkSat) walkStopList.clear();
  }
}

bool isStopListLengthEqualToStop(Algorithms type) {
  if (type == Algorithms.hillClimbing) return hillStopList.length == stop;
  if (type == Algorithms.depthFirst) return depthStopList.length == stop;
  if (type == Algorithms.dpll) return dpllStopList.length == stop;
  if (type == Algorithms.walkSat) return walkStopList.length == stop;
  return false;
}
