// ignore_for_file: avoid_print

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:propositional_analyzer/chart.dart';
import 'package:propositional_analyzer/constants.dart';
import 'package:propositional_analyzer/gready.dart';

import 'package:propositional_analyzer/new_value.dart';

void start(WidgetRef ref) {
  bool flag1 = false;
  bool flag2 = false;
  int M = 1;
  do {
    int sampleSum = 0;
    for (int j = 1; j <= sample; j++) {
      List<List<int>> problem = List.generate(M, (i) => List.filled(K, 0));
      problem = newProblem(problem);
      Search search = hillClimbing(problem, M);
      sampleSum = sampleSum + search.founded;
      print("---Sample $j: ${search.founded} with time: ${search.time} secs");

      problem.clear();
    }
    double average = sampleSum / sample;
    average = reduceDigitsTo3(average);
    print("Average: $average with M: $M");
    addSpot(M.toDouble(), average);

    if (average != 0.0 && flag1 == true) {
      flag1 = false;
    } else {
      flag2 = true;
    }

    if (average == 0.0) {
      flag1 = true;
    }

    M++;
  } while (flag2);
  addSpot(321, 0.8);
  addSpot(322, 0.6);
  addSpot(323, 0.3);
  addSpot(324, 0.2);
  addSpot(325, 0.1);
  ref.read(spotsProvider.notifier).state = spots;
}

double reduceDigitsTo3(double average) {
  String averageString = average.toString();
  int index = averageString.indexOf('.');
  if (index != -1 && index + 4 <= averageString.length) {
    averageString = averageString.substring(0, index + 4);
    average = double.parse(averageString);
  }
  return average;
}

List<FlSpot> spots = [];

addSpot(double M, double average) {
  // final list = ref.read(spotsProvider.notifier).state;
  // ref
  //     .read(spotsProvider.notifier)
  //     .state
  spots.add(FlSpot((M), average));
}

addTime(double M, double average) {
  // final list = ref.read(spotsProvider.notifier).state;
  // ref
  //     .read(spotsProvider.notifier)
  //     .state
  spots.add(FlSpot((M), average));
}
