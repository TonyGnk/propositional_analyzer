import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../screen_list.dart';
import '../Search Share/search_layout.dart';
import '../Search Share/track.dart';
import '../Search Share/algorithm_bridge.dart';
import '../Search Share/search_circle.dart';
import 'search_single_layout.dart';
import 'search_single_state.dart';

List<double> stopsPrimary = [];
List<double> stopsSecondary = [];
double stop1 = 0.333;
double stop2 = 0.3331;

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
              callCircle(true),
            )
          : mobileView(
              context,
              trackList,
              callCircle(false),
            ),
    );
  }

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
            str = 'M$M';
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
    await player.setSource(DeviceFileSource('assets/audio/finish.mp3'));
    await player.resume();
    goTo(ref, ScreenDestination.chartSingle);
  }
}
