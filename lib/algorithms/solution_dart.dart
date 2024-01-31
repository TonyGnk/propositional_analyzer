// Check whether a vector is a complete assignment and it is also valid.
import '../Services/global_variables.dart';

bool valid(List<int> vector, List<List<int>> problem, int M) {
  int i, j;
  bool satisfiable = false;

  for (i = 0; i < M; i++) {
    satisfiable = false;
    //
    for (j = 0; j < K; j++) {
      if ((problem[i][j] > 0 && vector[problem[i][j] - 1] >= 0) ||
          (problem[i][j] < 0 && vector[-problem[i][j] - 1] <= 0)) {
        satisfiable = true;
      }
    }
    if (satisfiable == false) {
      return false;
    }
  }
  return true;
}

// This function checks whether a current partial assignment is already invalid.
// In order for a partial assignment to be invalid, there should exist a sentence such that
// all propositions in the sentence have already value and their values are such that
// the sentence is false.
bool solution(List<int> vector, List<List<int>> problem, int M) {
  for (var i = 0; i < N; i++) {
    if (vector[i] == 0) {
      return false;
    }
  }

  return valid(vector, problem, M);
}
