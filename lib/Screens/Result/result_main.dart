// ignore_for_file: avoid_print

import 'dart:async';

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
  List<Container> trackList = [];
  Color color1 = Colors.orangeAccent;
  Color color2 = Colors.yellow;
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
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 320,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: 4.7124,
                  child: Container(
                    width: 215,
                    height: 215,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //sweep gradient
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
                  width: 200,
                  height: 200,
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
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Theme.of(context).shadowColor,
              ),
              padding: const EdgeInsets.all(20),
              clipBehavior: Clip.antiAlias,
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    trackList[trackList.length - 1 - index],
                itemCount: trackList.length,
              ),
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
                trackContainer(
                  context,
                  Text(
                    'Test $j with M=$M failed',
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Play',
                    ),
                  ),
                ),
              );
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
