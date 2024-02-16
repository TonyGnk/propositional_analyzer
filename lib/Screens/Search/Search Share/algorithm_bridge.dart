//import 'package:audioplayers/audioplayers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';

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
  spotsSearch.clear();
  spots1.clear();
  spots2.clear();
  spots2Hill.clear();
  spots2Depth.clear();
  spots2DPLL.clear();
  spots2Walk.clear();
}

runAlgorithm() async {
  List<List<int>> problem = newProblem();
  if (selected == 0) {
    return await solveHillClimbing(problem);
  } else if (selected == 1) {
    return await depthFirst(problem);
  } else if (selected == 2) {
    return await solveWithDpll(problem);
  } else if (selected == 3) {
    return await walkSat(problem);
  }
  problem.clear();
}

//Map with Algorithm type and the function to call
Map<Algorithms, Function> algorithmMap = {
  Algorithms.hillClimbing: solveHillClimbing,
  Algorithms.depthFirst: depthFirst,
  Algorithms.dpll: solveWithDpll,
  Algorithms.walkSat: walkSat,
};

addTrack(WidgetRef ref, List<Widget> trackList, int j,
    [bool isMulti = false, Algorithms type = Algorithms.hillClimbing]) {
  trackList.add(
    TrackContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Test $j with M=$M failed',
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Play',
            ),
          ),
          isMulti
              ? Text(
                  '${algorithmNames[type]!}  ',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Play',
                  ),
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
  //print('$type Test $j with M=$M failed');
  scrollDown(ref);
}

Map<Algorithms, String> algorithmNames = {
  Algorithms.hillClimbing: 'Hill Climbing',
  Algorithms.depthFirst: 'Depth First',
  Algorithms.dpll: 'DPLL',
  Algorithms.walkSat: 'Walk Sat',
};

final controllerProvider =
    StateProvider<ScrollController>((ref) => ScrollController());

scrollDown(WidgetRef ref) async {
  if (!hover) {
    ref.read(controllerProvider.notifier).state.animateTo(
          ref.read(controllerProvider.notifier).state.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        );
  }
}

// playSound() async {
//   AudioPlayer player = AudioPlayer();
//   if (speakerOn) {
//     // await player.setSource(DeviceFileSource(songPath));
//     // await player.resume();
//     //await player.setFilePath(songPath);
//     //await player.setAsset(songPath);
//     //await player.play();
//   }
// }

String songPath = (UniversalPlatform.isWeb)
    ? 'assets/assets/audio/finish.mp3'
    : 'assets/audio/finish.mp3';

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
  if (selectedDPLL) runningList.add(Algorithms.dpll);
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

equalizeMultiTimeSpots() {
  List<FlSpot> notEmpty = [];
  if (spots2Hill.isNotEmpty) notEmpty = List.from(spots2Hill);
  if (spots2Depth.isNotEmpty) notEmpty = List.from(spots2Depth);
  if (spots2DPLL.isNotEmpty) notEmpty = List.from(spots2DPLL);
  if (spots2Walk.isNotEmpty) notEmpty = List.from(spots2Walk);

  if (spots2Hill.length < notEmpty.length) {
    print('Here');
    for (int i = spots2Hill.length; i < notEmpty.length; i++) {
      spots2Hill.add(FlSpot(notEmpty.first.x, notEmpty.first.y));
    }
  }
  if (spots2Depth.length < notEmpty.length) {
    for (int i = spots2Depth.length; i < notEmpty.length; i++) {
      spots2Depth.add(FlSpot(notEmpty.first.x, notEmpty.first.y));
    }
  }
  if (spots2DPLL.length < notEmpty.length) {
    for (int i = spots2DPLL.length; i < notEmpty.length; i++) {
      spots2DPLL.add(FlSpot(notEmpty.first.x, notEmpty.first.y));
    }
  }
  if (spots2Walk.length < notEmpty.length) {
    for (int i = spots2Walk.length; i < notEmpty.length; i++) {
      spots2Walk.add(FlSpot(notEmpty.first.x, notEmpty.first.y));
    }
  }
}
