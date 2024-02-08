// Given a partial assignment vector, for which a subset of the first propositions have values,
// this function pushes up to two new vectors to the stack, which concern giving to the first unassigned
// proposition the values true=1 and false=-1, after checking that the new vectors are valid.
import '../global_variables.dart';
import 'al2.dart';
import 'depth_first.dart';
import 'solution_dart.dart';

// generateChildren(List<bool?> vector, List<List<int>> problem) {
//   int i;

//   // Find the first proposition with null value.
//   int maxCount = -1;
//   int maxIndex = -1;
//   for (i = 0; i < N; i++) {
//     if (vector[i] == null) {
//       int count = problem
//           .where(
//               (clause) => clause.contains(i + 1) || clause.contains(-(i + 1)))
//           .length;
//       if (count > maxCount) {
//         maxCount = count;
//         maxIndex = i;
//       }
//     }
//   }
//   List<bool?> vectorTrue = List.from(vector);
//   List<bool?> vectorFalse = List.from(vector);

//   if (maxIndex != -1) {
//     vectorTrue[maxIndex] = false;
//     stackItems.add(vectorTrue);

//     vectorFalse[maxIndex] = true;
//     stackItems.add(vectorFalse);
//   }
// }

generateChildren(List<bool?> vector, List<List<int>> problem) {
  int i;
  List<bool?> vectorTrue = List.from(vector);
  List<bool?> vectorFalse = List.from(vector);
  print('Vector: $vector');

  // Find the first proposition with null value.
  for (i = 0; i < N; i++) {
    if (vector[i] == null) break;
  }

  vectorTrue[i] = false;
  print('ADD Vector: $vectorTrue');
  if (valid(vectorTrue, problem)) stackItems.insert(0, vectorTrue);

  vectorFalse[i] = true;
  print('ADD Vector: $vectorFalse');
  if (valid(vectorFalse, problem)) stackItems.insert(0, vectorFalse);
}
