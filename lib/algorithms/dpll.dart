// Implementation of the DPLL algorithm.
// Input: List<List<int>> clauses for example [[1, 2], [-1, 3]
// Output: a List<bool> of the model that satisfies the clauses for example [true, false]

//Helper function findUnmetIndexes(List<bool> solution, List<List<int>> problem) finds the indexes of the clauses that are not satisfied by the solution.

//Variable N is the number of variables in the problem.

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'solution_dart.dart';

DateTime startTimeDPLL = DateTime.now();
DateTime nowTimeDPLL = DateTime.now();

solveWithDpll(List<List<int>> clauses) async {
  //Create a list of N nulls
  List<bool?> solution = List.filled(N, null);

  setLiteralFrequencyList(clauses);
  //print(literalFrequencyOrder);
  startTimeDPLL = DateTime.now();

  //Call the recursive function with the solution and the problem
  bool result = dpllRecursive(solution, clauses, 0);

  if (result) {
    return Search(
        win: true, time: nowTimeDPLL.difference(startTimeDPLL).inSeconds);
  } else {
    return const Search(win: false);
  }
}

//Recursive function that tries to find a solution
dpllRecursive(
  List<bool?> solution,
  List<List<int>> problem,
  int depth,
) {
  //print('\nDepth: $depth');

  nowTimeDPLL = DateTime.now();
  if (nowTimeDPLL.difference(startTimeDPLL).inSeconds > timeOut) {
    //print('Time out in Depth First');
    return false;
  }

  if (!solution.contains(null)) {
    return true;
  } else {
    int index = literalFrequencyOrder[depth];

    //Create a copy of the solution with the variable set to true
    List<bool?> solutionTrue = List.from(solution);
    solutionTrue[index - 1] = true;

    //Create a copy of the solution with the variable set to false
    List<bool?> solutionFalse = List.from(solution);
    solutionFalse[index - 1] = false;

    //If the solution with the variable set to true is valid then return true
    if (valid(solutionTrue, problem)) {
      if (dpllRecursive(solutionTrue, problem, depth + 1)) {
        return true;
      }
    }

    //If the solution with the variable set to false is valid then return true
    if (valid(solutionFalse, problem)) {
      if (dpllRecursive(solutionFalse, problem, depth + 1)) {
        return true;
      }
    }

    return false;
  }
}

List<int> literalFrequencyOrder = [];
void setLiteralFrequencyList(List<List<int>> problem) {
  literalFrequencyOrder = [];
  Map<int, int> literalFrequency = {};

  // Calculate the frequency of each literal in the problem
  for (var clause in problem) {
    for (var literal in clause) {
      int absoluteLiteral = literal.abs();
      if (literalFrequency.containsKey(absoluteLiteral)) {
        literalFrequency[absoluteLiteral] =
            (literalFrequency[absoluteLiteral] ?? 0) + 1;
      } else {
        literalFrequency[absoluteLiteral] = 1;
      }
    }
  }

  //If N>K add the missing literals to the frequency map with frequency 0
  for (int i = 1; i <= N; i++) {
    if (!literalFrequency.containsKey(i)) {
      literalFrequency[i] = 0;
    }
  }

  // Sort the literals map by frequency and store it to literalFrequencyOrder list
  //print('Without sort: $literalFrequency');
  literalFrequencyOrder = literalFrequency.keys.toList()
    ..sort((a, b) => literalFrequency[b]!.compareTo(literalFrequency[a]!));
}
