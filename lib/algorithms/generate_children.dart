// Given a partial assignment vector, for which a subset of the first propositions have values,
// this function pushes up to two new vectors to the stack, which concern giving to the first unassigned
// proposition the values true=1 and false=-1, after checking that the new vectors are valid.
import '../constants.dart';
import 'depth_first.dart';
import 'solution_dart.dart';

generateChildren(List<int> vector, List<List<int>> problem, int M) {
  int i;

  // Find the first proposition with no assigned value.
  for (i = 0; i < N - 1 && vector[i] != 0; i++) {}

  vector[i] = -1;
  if (valid(vector, problem, M)) {
    head.push(vector);
  }

  vector[i] = 1;
  if (valid(vector, problem, M)) {
    head.push(vector);
  }
}
