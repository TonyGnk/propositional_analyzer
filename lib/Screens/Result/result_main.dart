// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Services/global_variables.dart';
import '../screen_list.dart';
import 'algorithm_bridge.dart';
import 'result_state.dart';
import 'track.dart';

class Result extends ConsumerStatefulWidget {
  const Result({super.key});

  @override
  ConsumerState<Result> createState() => _ResultState();
}

List<double> stopsPrimary = [];
List<double> stopsSecondary = [];
double stop1 = 0.333;
double stop2 = 0.3331;

class _ResultState extends ConsumerState<Result> {
  List<TrackContainer> trackList = [];
  Color color1 = Colors.orangeAccent;
  String str = 'M0';
  String str2 = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      resultReturn(ref);
    });
    algorithm();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    return animatedColumn(
      isDesktop ? desktopView(isDesktop) : mobileView(),
    );
  }

  mobileView() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          circle(),
          const SizedBox(height: 20),
          Expanded(
            child: trackListContainer(
              context,
              ListView.builder(
                controller: controller,
                dragStartBehavior: DragStartBehavior.down,
                itemBuilder: (context, index) => trackList[index],
                itemCount: trackList.length,
              ),
            ),
          ),
        ],
      );

  desktopView(bool isDesktop) => Row(
        children: [
          SizedBox(
            width: 280,
            child: trackListContainer(
              context,
              ListView.builder(
                controller: controller,
                dragStartBehavior: DragStartBehavior.down,
                itemBuilder: (context, index) => trackList[index],
                itemCount: trackList.length,
              ),
            ),
          ),
          Expanded(
            child: Center(child: circle(isDesktop)),
          ),
          //circle(),
        ],
      );

  circle([bool isDesktop = false]) => Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: 4.7124,
            child: Container(
              width: isDesktop ? 335 : 215,
              height: isDesktop ? 335 : 215,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    color1,
                    Theme.of(context).unselectedWidgetColor,
                  ],
                  stops: [stop1, stop2],
                ),
              ),
            ),
          ),
          Container(
            width: isDesktop ? 320 : 200,
            height: isDesktop ? 320 : 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).unselectedWidgetColor,
              //border color
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  str,
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Play',
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  str2,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Play',
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  algorithm() async {
    await Future.delayed(Duration.zero, () {
      setState(() {
        initializeCircle();
      });
    });
    initializingData();
    List<bool> stopList = [];
    int sampleSum = 0;
    int timeSum = 0;
    do {
      sampleSum = 0;
      timeSum = 0;
      for (int j = 1; j <= numberOfTests; j++) {
        Search search = await runAlgorithm();
        int founded = search.win ? 1 : 0;
        sampleSum = sampleSum + founded;
        timeSum = timeSum + search.time;

        await Future.delayed(Duration.zero, () {
          setState(() {
            str2 = '$sampleSum/$numberOfTests';

            stop1 = stopsPrimary[j - 1];
            stop2 = stopsSecondary[j - 1];

            if (founded != 1) {
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
          });
        });
      }
      double n = sampleSum / numberOfTests;
      double averageTime = timeSum / numberOfTests;
      addSpot(M.toDouble(), n, averageTime);

      await Future.delayed(Duration.zero, () {
        setState(() {
          str = 'M$M';
          str2 = '$sampleSum/$numberOfTests';
        });
      });

      M++;
      if (sampleSum == 0) {
        stopList.add(true);
      } else {
        stopList.clear();
      }

      //await Future.delayed(const Duration(seconds: 1));
      //} while (M < 342);
    } while (stopList.length != stop);
    goTo(ref, ScreenDestination.chart);
  }
}
