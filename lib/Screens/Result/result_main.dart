// ignore_for_file: avoid_print

import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants.dart';
import '../../gready.dart';
import '../../new_value.dart';
import '../screen_list.dart';
import 'result_state.dart';
import 'track.dart';

class Result extends ConsumerStatefulWidget {
  const Result({super.key});

  @override
  ConsumerState<Result> createState() => _ResultState();
}

class _ResultState extends ConsumerState<Result> {
  List<Container> trackList = [];
  Color color1 = Colors.black;
  Color color2 = Colors.black;
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
                      color: color1,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        str,
                        style: const TextStyle(
                          fontSize: 35,
                          fontFamily: 'Play',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        str2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Play',
                          color: Colors.black,
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
    spots1.clear();
    spots2.clear();
    int M = 1;
    int sampleSum = 0;
    int timeSum = 0;
    do {
      sampleSum = 0;
      timeSum = 0;
      for (int j = 1; j <= numberOfTests; j++) {
        List<List<int>> problem = List.generate(M, (i) => List.filled(K, 0));
        problem = newProblem(problem);
        Search search = hillClimbing(problem, M);
        int founded = search.win ? 1 : 0;
        sampleSum = sampleSum + founded;
        print('SearchTime is ${search.time}');
        timeSum = timeSum + search.time;

        await Future.delayed(Duration.zero, () {
          setState(() {
            str2 = '$sampleSum/$numberOfTests';

            if (founded != 1) {
              trackList.add(
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey,
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'With M=$M the test $j failed',
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

        problem.clear();
      }
      double n = sampleSum / numberOfTests;
      double averageTime = timeSum / numberOfTests;
      addSpot(M.toDouble(), n, averageTime);

      await Future.delayed(Duration.zero, () {
        setState(() {
          //updateUi(sampleSum);

          if (n == 1 / numberOfTests) {
            color1 = Colors.red;
          } else if (n == 2 / numberOfTests) {
            color1 = Colors.yellow;
          } else {
            color1 = Colors.green;
          }
          str = 'M$M';
          str2 = '$sampleSum/$numberOfTests';
        });
      });

      M++;
    } while (M < 455);
    // spots1.add(FlSpot(M.toDouble(), 0.66));
    // spots1.add(FlSpot(M.toDouble() + 1, 0.66));
    // spots1.add(FlSpot(M.toDouble() + 2, 0.33));
    resultGo(ref, ScreenDestination.chart);
  }
}

addSpot(double M, double average, double averageTime) {
//Divide the M with the const N and keep only 1 decimal
  M = M / N;
  M = double.parse(M.toStringAsFixed(1));

  spots1.add(FlSpot(M, average));
  spots2.add(FlSpot(M, averageTime));
  print('Added the spot: $M, $averageTime');
}

hillClimbing(
  List<List<int>> problem,
  int M,
) {
  List<int> vector = List.filled(N, 0);
  int h, h1, h2;
  int restarts = 0, steps = 0;
  int bestChange;

  DateTime t1 = DateTime.now();

  // Initialization steps
  vector = initialize(vector);
  h = count(vector, problem, M);

  while (h > 0) {
    DateTime t = DateTime.now();
    if (t.difference(t1).inSeconds > TIMEOUT) {
      DateTime t2 = DateTime.now();
      //print("\n\nNO SOLUTION found with hill-climbing...\n");
      return Search(
        win: false,
        time: t2.difference(t1).inSeconds,
      );
    }

    steps++;
    h2 = h;
    bestChange = -1;
    for (int i = 0; i < N; i++) {
      vector[i] = -vector[i];
      h1 = count(vector, problem, M);
      if (h1 < h2) {
        h2 = h1;
        bestChange = i;
      }
      vector[i] = -vector[i];
    }

    if (bestChange >= 0) {
      vector[bestChange] = -vector[bestChange];
    } else {
      vector = initialize(vector);
      restarts++;
    }
    h = count(vector, problem, M);
  }

  DateTime t2 = DateTime.now();
  //print("Solution found with hill-climbing!");
  //display(vector);
  //print("Time spent: ${t2.difference(t1).inSeconds} secs");
  return Search(
    win: true,
    time: t2.difference(t1).inSeconds,
  );
}