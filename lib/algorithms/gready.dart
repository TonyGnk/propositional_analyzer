import 'dart:math';

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';

Future<Search> solveHillClimbing(List<List<int>> problem) async {
  List<int> vector = List.filled(N, 0);
  int h, h1, h2;
  int bestChange;

  DateTime t1 = DateTime.now();

  vector = initialize(vector);
  h = count(vector, problem, M);

  while (h > 0) {
    await Future.delayed(Duration.zero, () {});
    DateTime t = DateTime.now();
    if (t.difference(t1).inSeconds > timeOut) {
      //Print Time
      print('TimeOUT - Time: ${t.difference(t1).inMilliseconds} ms');
      return Search(
        win: false,
        time: t.difference(t1).inMilliseconds,
      );
    }

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
    }
    h = count(vector, problem, M);
  }

  DateTime t2 = DateTime.now();
  return Search(
    win: true,
    time: t2.difference(t1).inMilliseconds,
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
