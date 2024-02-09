import 'package:audioplayers/audioplayers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../../global_variables.dart';
import '../../Charts/Charts Multi/line_data.dart';
import '../../screen_list.dart';
import '../Search Multi/multi_chart_bar.dart';
import '../Search Share/search_layout.dart';
import '../Search Share/track.dart';
import '../Search Share/algorithm_bridge.dart';
import '../Search Share/search_circle.dart';
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
            maxY: 1.01,
            minX: spotsHillSearch.first.x,
            maxX: spotsHillSearch.last.x,
            lineTouchData: const LineTouchData(enabled: false),
            clipData: const FlClipData.all(),
            gridData: const FlGridData(
              show: true,
              drawVerticalLine: false,
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              line(spotsHillSearch, orange1),
              line(spotsDepthSearch, orange2),
              line(spotsDPLLSearch, orange3),
              line(spotsWalkSearch, orange4),
            ],
            titlesData: const FlTitlesData(
              show: false,
            ),
          ),
        ),
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
            str2 = '$sampleSum/$numberOfTests';

            stop1 = stopsPrimary[j - 1];
            stop2 = stopsSecondary[j - 1];

            if (founded != 1) addTrack(trackList, j);
          });
        });
      }
      double n = sampleSum / numberOfTests;
      double averageTime = timeSum / numberOfTests;
      addSpot(M.toDouble(), n, averageTime);

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
}
