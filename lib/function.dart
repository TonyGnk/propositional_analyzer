// ignore_for_file: avoid_print

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Screens/Result/track.dart';
import 'chart.dart';
import 'constants.dart';
import 'gready.dart';

import 'new_value.dart';

void start(WidgetRef ref) {
  bool flag1 = false;
  bool flag2 = false;
  int M = 1;
  do {
    int sampleSum = 0;
    for (int j = 1; j <= sample; j++) {
      List<List<int>> problem = List.generate(M, (i) => List.filled(K, 0));
      problem = newProblem(problem);
      Track track = hillClimbing(problem, M);
      sampleSum = sampleSum + track.founded;
      print('---Sample $j: ${track.founded} with time: ${track.time} secs');

      problem.clear();
    }
    double average = sampleSum / sample;
    average = reduceDigitsTo3(average);
    print('Average: $average with M: $M');
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
  } while (M <= 30);
  addSpot(M.toDouble() + 1, 0.66);
  addSpot(M.toDouble() + 2, 0.66);
  addSpot(M.toDouble() + 3, 0.66);
  addSpot(M.toDouble() + 4, 0.66);

  addSpot(M.toDouble() + 5, 0.33);
  addSpot(M.toDouble() + 6, 0.33);
  addSpot(M.toDouble() + 7, 0.66);

  addSpot(M.toDouble() + 8, 0.33);
  addSpot(M.toDouble() + 9, 0.33);

  addSpot(M.toDouble() + 10, 0.33);

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
  spots.add(FlSpot(M, average));
}

addTime(double M, double average) {
  spots.add(FlSpot(M, average));
}
