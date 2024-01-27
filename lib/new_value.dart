// This function creates randomly a new problem. Takes a 2D list
import 'dart:math';

import 'constants.dart';

List<List<int>> newProblem(List<List<int>> problem) {
  int M = problem.length;
  Random rand = Random();

  for (int i = 0; i < M; i++) {
    for (int j = 0; j < K; j++) {
      int r;
      do {
        r = rand.nextInt(N) + 1;
      } while (newValue(r, i, j, problem) == 0);
      problem[i][j] = r;
      r = rand.nextInt(100);
      if (r < 50) {
        problem[i][j] = -problem[i][j];
      }
    }
  }
  return problem;
}

int newValue(int r, int i, int j, List<List<int>> problem) {
  for (int jj = 0; jj < j; jj++) {
    if (problem[i][jj].abs() == r) {
      return 0;
    }
  }
  return 1;
}
