// This function creates randomly a new SAT problem. Takes a 2D list
import 'dart:math';

import '../global_variables.dart';

List<List<int>> newProblem() {
  List<List<int>> problem = List.generate(M, (i) => List.filled(K, 0));
  Random rand = Random();

  //Fill the problem with random values
  for (int i = 0; i < M; i++) {
    //Fill the clause with random values
    for (int j = 0; j < K; j++) {
      //Initialize the value of the variable
      int r;
      do {
        //Generate a random value between 1 and N
        r = rand.nextInt(N) + 1;
        //Check if the value is already in the clause. If it is, generate a new one
      } while (newValue(r, i, j, problem) == 0);
      //Assign the value to the clause
      problem[i][j] = r;
      //Flip the sign of the value with 50% probability
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
