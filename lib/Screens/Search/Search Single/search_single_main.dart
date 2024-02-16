import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../screen_list.dart';
import '../Search Multi/multi_chart_bar.dart';
import '../Search Share/search_layout.dart';
import '../Search Share/track.dart';
import '../Search Share/algorithm_bridge.dart';
import 'search_single_layout.dart';
import 'search_single_state.dart';

class SearchSingleState extends ConsumerState<SearchSingle> {
  List<TrackContainer> trackList = [];
  String str = 'M0';
  String str2 = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      searchSingleReturn(ref);
    });
    algorithm();
  }

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
              chart(context),
            )
          : mobileView(
              context,
              trackList,
              str,
              str2,
              chart(context),
            ),
    );
  }

  chart(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: spotsSearch.isNotEmpty
            ? LineChart(
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
                    line(spotsSearch, Theme.of(context).colorScheme.primary),
                  ],
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                ),
              )
            : const Center(child: SizedBox()),
      );

  algorithm() async {
    await Future.delayed(Duration.zero, () => setState(() => initializeData()));
    List<bool> stopList = [];
    int sampleSum = 0;
    Search solution;
    int founded;
    int timeSum = 0;
    do {
      sampleSum = 0;
      timeSum = 0;

      for (int j = 1; j <= numberOfTests; j++) {
        solution = await runAlgorithm();
        founded = solution.win ? 1 : 0;
        sampleSum = sampleSum + founded;
        timeSum = timeSum + solution.time;
        await Future.delayed(Duration.zero, () {
          setState(() {
            str = 'M=$M';
            str2 = '$j/$numberOfTests';

            stop1 = stopsPrimary[j - 1];
            stop2 = stopsSecondary[j - 1];

            if (founded != 1) addTrack(ref, trackList, j);
          });
        });
      }
      double averageTime = timeSum / numberOfTests;

      await Future.delayed(Duration.zero, () {
        setState(() {
          addSpot(M.toDouble(), sampleSum.toDouble(), averageTime);
        });
      });

      M++;
      if (sampleSum == 0) {
        stopList.add(true);
      } else {
        stopList.clear();
      }
    } while (stopList.length != stop);
    playSound();
    goTo(ref, ScreenDestination.chartSingle);
  }

  addSpot(double M, double average, double averageTime) {
    M = M / N;
    M = double.parse(M.toStringAsFixed(1));
    averageTime = double.parse(averageTime.toStringAsFixed(2));

    spotsSearch.add(FlSpot(M, average));
    spots1.add(FlSpot(M, average));
    spots2.add(FlSpot(M, averageTime));
    while (spotsSearch.length > 30) {
      spotsSearch.removeAt(0);
    }
  }
}
