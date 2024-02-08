import '../global_variables.dart';
import 'depth_first.dart';
import 'solution_dart.dart';

generateChildren(List<bool?> vector, List<List<int>> problem) {
  int i;
  List<bool?> vectorTrue = List.from(vector);
  List<bool?> vectorFalse = List.from(vector);

  // Find the first proposition with null value.
  for (i = 0; i < N; i++) {
    if (vector[i] == null) break;
  }

  vectorTrue[i] = false;
  if (valid(vectorTrue, problem)) stackItems.insert(0, vectorTrue);

  vectorFalse[i] = true;
  if (valid(vectorFalse, problem)) stackItems.insert(0, vectorFalse);
}
