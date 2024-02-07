// ignore_for_file: avoid_print

import 'dart:math';

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';

hillClimbing(List<List<int>> problem) async {
  List<int> vector = List.filled(N, 0);
  int h, h1, h2;
  //int restarts = 0, steps = 0;
  int bestChange;

  DateTime t1 = DateTime.now();

  // Initialization steps
  vector = initialize(vector);
  h = count(vector, problem, M);

  while (h > 0) {
    await Future.delayed(Duration.zero, () {});
    DateTime t = DateTime.now();
    if (t.difference(t1).inSeconds > timeOut) {
      DateTime t2 = DateTime.now();
      return Search(
        win: false,
        time: t2.difference(t1).inSeconds,
      );
    }

    //steps++;
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
      //restarts++;
    }
    h = count(vector, problem, M);
  }

  DateTime t2 = DateTime.now();
  //print("Solution found with hill-climbing!");
  //print("Time spent: ${t2.difference(t1).inSeconds} secs");
  return Search(
    win: true,
    time: t2.difference(t1).inSeconds,
  );
}

// Initializing a vector of values for the propositions with random values
List<int> initialize(List<int> vector) {
  Random rand = Random();
  for (int i = 0; i < N; i++) {
    int r = rand.nextInt(100);
    if (r >= 50) {
      vector[i] = 1;
    } else {
      vector[i] = -1;
    }
  }
  return vector;
}

int count(List<int> vector, List<List<int>> problem, int M) {
  int c = 0, satisfied;
  for (int i = 0; i < M; i++) {
    satisfied = 0;
    for (int j = 0; j < K; j++) {
      if ((problem[i][j] > 0 && vector[problem[i][j] - 1] == 1) ||
          (problem[i][j] < 0 && vector[-problem[i][j] - 1] == -1)) {
        satisfied = 1;
      }
    }

    c += satisfied;
  }

  return M - c;
}
