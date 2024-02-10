// ignore_for_file: avoid_print

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../algorithms/new_value.dart';
import '../../../global_variables.dart';
import '../../Charts/Charts Multi/line_data.dart';
import '../../screen_list.dart';
import '../Search Share/algorithm_bridge.dart';
import '../Search Share/search_circle.dart';
import '../Search Share/search_layout.dart';
import '../Search Share/track.dart';
import 'multi_chart_bar.dart';
import 'search_multi_layout.dart';
import 'search_multi_state.dart';

class SearchMultiState extends ConsumerState<SearchMulti> {
  List<TrackContainer> trackList = [];

  Color color1 = Colors.orangeAccent;
  String str = 'M0';
  String str2 = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      searchMultiReturn(ref);
    });
    multipleScheduler();
  }

  callCircle(bool value) => circle(context, str, str2, stop1, stop2, value);

  @override
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    return animatedColumn(
      isDesktop
          ? desktopView(
              context,
              isDesktop,
              trackList,
              str,
              str2,
              chart(),
            )
          : mobileView(
              context,
              trackList,
              str,
              str2,
              chart(),
            ),
    );
  }

  chart() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: isNotEmptyMultiSpots()
            ? LineChart(
                duration: const Duration(milliseconds: 1000),
                LineChartData(
                  minY: 0,
                  maxY: 1.01,
                  lineTouchData: const LineTouchData(enabled: false),
                  clipData: const FlClipData.all(),
                  gridData: const FlGridData(
                    show: true,
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    spotsHillSearch.isNotEmpty
                        ? line(spotsHillSearch, orange1)
                        : line(emptySpots, orange1),
                    spotsDepthSearch.isNotEmpty
                        ? line(spotsDepthSearch, orange2)
                        : line(emptySpots, orange2),
                    spotsDPLLSearch.isNotEmpty
                        ? line(spotsDPLLSearch, orange3)
                        : line(emptySpots, orange3),
                    spotsWalkSearch.isNotEmpty
                        ? line(spotsWalkSearch, orange4)
                        : line(emptySpots, orange4),
                  ],
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                ),
              )
            : const Center(child: SizedBox()),
      );

  multipleScheduler() async {
    await Future.delayed(Duration.zero, () => setState(() => initializeData()));
    List<List<List<int>>> problemList = [];
    checkWhichRunning();

    do {
      problemList.clear();
      for (int i = 0; i < numberOfTests; i++) {
        problemList.add(newProblem());
      }
      for (Algorithms type in runningList) {
        if (findHasMore(type)) {
          await algorithm(type, problemList);
        }
      }
      M++;
    } while (countOfFalseHasMore() != runningList.length);
    print('All tests are done');
    playSound();
    goTo(ref, ScreenDestination.chartMulti);
  }

  algorithm(Algorithms type, List<List<List<int>>> problemList) async {
    int sampleSum = 0;
    Search solution;
    int founded;
    int timeSum = 0;

    sampleSum = 0;
    timeSum = 0;

    for (int j = 1; j <= numberOfTests; j++) {
      solution = await algorithmMap[type]!(problemList[j - 1]);
      founded = solution.win ? 1 : 0;
      sampleSum = sampleSum + founded;
      timeSum = timeSum + solution.time;
      await Future.delayed(Duration.zero, () {
        setState(() {
          str = 'M=$M';
          str2 = 'Test $sampleSum/$numberOfTests';

          stop1 = stopsPrimary[j - 1];
          stop2 = stopsSecondary[j - 1];

          if (founded != 1) addTrack(trackList, j, type.toString());
        });
      });
    }
    double n = sampleSum / numberOfTests;
    double averageTime = timeSum / numberOfTests;
    await Future.delayed(Duration.zero, () {
      setState(() {
        addMultipleSpot(M.toDouble(), n, averageTime, type);
      });
    });

    addStopList(sampleSum, type);

    if (isStopListLengthEqualToStop(type)) {
      setHasMore(type, false);
    }
  }

  addMultipleSpot(
    double M,
    double average,
    double averageTime,
    Algorithms type,
  ) {
    M = M / N;
    M = double.parse(M.toStringAsFixed(1));

    if (type == Algorithms.hillClimbing) {
      spotsHillSearch.add(FlSpot(M, average));
      spots1Hill.add(FlSpot(M, average));
      spots2Hill.add(FlSpot(M, averageTime));
      while (spotsHillSearch.length > 30) {
        spotsHillSearch.removeAt(0);
      }
    }
    if (type == Algorithms.depthFirst) {
      spotsDepthSearch.add(FlSpot(M, average));
      spots1Depth.add(FlSpot(M, average));
      spots2Depth.add(FlSpot(M, averageTime));
      while (spotsDepthSearch.length > 30) {
        spotsDepthSearch.removeAt(0);
      }
    }
    if (type == Algorithms.dpll) {
      spotsDPLLSearch.add(FlSpot(M, average));
      spots1DPLL.add(FlSpot(M, average));
      spots2DPLL.add(FlSpot(M, averageTime));
      while (spotsDPLLSearch.length > 30) {
        spotsDPLLSearch.removeAt(0);
      }
    }
    if (type == Algorithms.walkSat) {
      spotsWalkSearch.add(FlSpot(M, average));
      spots1Walk.add(FlSpot(M, average));
      spots2Walk.add(FlSpot(M, averageTime));
      while (spotsWalkSearch.length > 30) {
        spotsWalkSearch.removeAt(0);
      }
    }
  }
}
