// ignore_for_file: avoid_print

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../screen_list.dart';
import '../Search Share/algorithm_bridge.dart';
import '../Search Share/search_circle.dart';
import '../Search Share/search_layout.dart';
import '../Search Share/track.dart';
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
    if (selectedHill) {
      print('Hill Climbing');
      algorithm(Algorithms.hillClimbing);
    }
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

  algorithm(Algorithms type) async {
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
        solution = await runAlgorithmNew(type);
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
