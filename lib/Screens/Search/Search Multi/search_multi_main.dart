import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../algorithms/new_value.dart';
import '../../../global_variables.dart';
import '../../Charts/Charts Multi/line_data.dart';
import '../../screen_list.dart';
import '../Search Share/algorithm_bridge.dart';
import '../Search Share/search_layout.dart';
import '../Search Share/track.dart';
import 'multi_chart_bar.dart';
import 'search_multi_layout.dart';
import 'search_multi_state.dart';

class SearchMultiState extends ConsumerState<SearchMulti> {
  List<Widget> trackList = [];

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

  @override
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    return animatedColumn(
      (MediaQuery.of(context).size.width > 600)
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
      child: LineChart(
        duration: const Duration(milliseconds: 1000),
        LineChartData(
          minY: 0,
          maxY: numberOfTests.toDouble(),
          lineTouchData: const LineTouchData(enabled: false),
          clipData: const FlClipData.all(),
          gridData: const FlGridData(
            show: true,
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            spotsSearch.isNotEmpty
                ? line(spotsSearch, orange3)
                : line(emptySpots, orange1),
          ],
          titlesData: const FlTitlesData(
            show: false,
          ),
        ),
      ));

  multipleScheduler() async {
    await Future.delayed(Duration.zero, () => setState(() => initializeData()));
    List<List<List<int>>> problemList = [];
    checkWhichRunning();

    int sampleSum = 0;
    do {
      problemList.clear();
      for (int i = 0; i < numberOfTests; i++) {
        problemList.add(newProblem());
      }
      for (Algorithms type in runningList) {
        if (findHasMore(type)) {
          sampleSum = await algorithm(type, problemList);
        }
      }
      addSpot(M.toDouble(), sampleSum.toDouble());
      M++;
    } while (countOfFalseHasMore() != runningList.length);
    print('All algorithms have finished');
    //playSound();
    equalizeMultiTimeSpots();
    goTo(ref, ScreenDestination.chartMulti);
  }

  Future<int> algorithm(
    Algorithms type,
    List<List<List<int>>> problemList,
  ) async {
    int sampleSum = 0;
    Search solution;
    int founded;
    int timeSum = 0;

    timeSum = 0;

    for (int j = 1; j <= numberOfTests; j++) {
      solution = await algorithmMap[type]!(problemList[j - 1]);
      founded = solution.win ? 1 : 0;
      sampleSum = sampleSum + founded;
      timeSum = timeSum + solution.time;
      await Future.delayed(Duration.zero, () {
        setState(() {
          str = 'M=$M';
          str2 = 'Test $j/$numberOfTests';

          stop1 = stopsPrimary[j - 1];
          stop2 = stopsSecondary[j - 1];

          if (founded != 1) addTrack(ref, trackList, j, true, type);
        });
      });
    }
    double averageTime = timeSum / numberOfTests;
    await Future.delayed(Duration.zero, () {
      setState(() {
        addMultipleSpot(M.toDouble(), averageTime.toDouble(), type);
      });
    });

    addStopList(sampleSum, type);

    if (isStopListLengthEqualToStop(type)) {
      setHasMore(type, false);
    }
    return sampleSum;
  }

  addSpot(
    double M,
    double average,
  ) {
    M = M / N;
    M = double.parse(M.toStringAsFixed(1));

    spots1.add(FlSpot(M, average));
    spotsSearch.add(FlSpot(M, average));
    while (spotsSearch.length > 30) {
      spotsSearch.removeAt(0);
    }
  }

  addMultipleSpot(
    double M,
    double averageTime,
    Algorithms type,
  ) {
    M = M / N;
    M = double.parse(M.toStringAsFixed(1));
    averageTime = double.parse(averageTime.toStringAsFixed(2));

    if (type == Algorithms.hillClimbing) {
      spots2Hill.add(FlSpot(M, averageTime));
    }
    if (type == Algorithms.depthFirst) {
      spots2Depth.add(FlSpot(M, averageTime));
    }
    if (type == Algorithms.dpll) {
      spots2DPLL.add(FlSpot(M, averageTime));
    }
    if (type == Algorithms.walkSat) {
      spots2Walk.add(FlSpot(M, averageTime));
    }
  }
}
