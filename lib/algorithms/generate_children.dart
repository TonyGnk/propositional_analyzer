// Given a partial assignment vector, for which a subset of the first propositions have values,
// this function pushes up to two new vectors to the stack, which concern giving to the first unassigned
// proposition the values true=1 and false=-1, after checking that the new vectors are valid.
import '../global_variables.dart';
import 'depth_first.dart';
import 'solution_dart.dart';

generateChildren(List<bool?> vector, List<List<int>> problem, int M) {
  int i;

  // Find the first proposition with null value.
  for (i = 0; i < N; i++) {
    if (vector[i] == null) break;
  }

  vector[i] = false;
  //if (valid(vector, problem, M)) {
  head.push(vector);
  //}

  vector[i] = true;
  //if (valid(vector, problem, M)) {
  head.push(vector);
  //}
}
