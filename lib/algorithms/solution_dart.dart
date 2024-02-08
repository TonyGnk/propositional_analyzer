// Check whether a vector is a complete assignment and it is also valid.
import '../global_variables.dart';

complete(List<bool?> vector) {
  //Check if there is any null value in the vector
  for (var i = 0; i < N; i++) {
    if (vector[i] == null) {
      return false;
    }
  }
  return true;
}

// bool valid(List<bool?> vector, List<List<int>> problem) {
//   int i, j;
//   bool satisfiable = false;

//   // Convert the vector to a list of integers. If true 1, if false -1 if null 0
//   List<int> vectorInt = [];
//   for (i = 0; i < N; i++) {
//     if (vector[i] == true) {
//       vectorInt.add(1);
//     } else if (vector[i] == false) {
//       vectorInt.add(-1);
//     } else {
//       vectorInt.add(0);
//     }
//   }

//   for (i = 0; i < M; i++) {
//     // Check if the clause is satisfied
//     satisfiable = false;
//     for (j = 0; j < K; j++) {
//       int variable = problem[i][j];
//       if ((variable > 0 && (vectorInt[variable - 1] >= 0)) ||
//           (variable < 0 && (vectorInt[-variable - 1] <= 0))) {
//         satisfiable = true;
//       }
//     }
//     if (!satisfiable) {
//       return false;
//     }
//   }
//   return true;
// }

bool valid(List<bool?> vector, List<List<int>> problem) {
  int i, j;
  bool satisfiable = false;
  // ignore: unused_local_variable
  bool isPositive, isNegative, trueNull, falseNull, condition;

  for (i = 0; i < M; i++) {
    // Check if the clause is satisfied
    satisfiable = false;
    for (j = 0; j < K; j++) {
      // Get the item in the clause
      int item = problem[i][j];

      isPositive = item > 0;
      //trueNull = vector[item - 1] == null || vector[item - 1] == true;
      trueNull =
          vector[item.abs() - 1] == null || vector[item.abs() - 1] == true;

      isNegative = item < 0;
      //falseNull = vector[-item - 1] == null || vector[-item - 1] == false;
      falseNull =
          vector[item.abs() - 1] == null || vector[item.abs() - 1] == false;

      condition = (isPositive && trueNull) || (isNegative && falseNull);
      if (condition) satisfiable = true;
    }
    if (!satisfiable) return false;
  }
  return true;
}
