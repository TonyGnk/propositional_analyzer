//The purpose of this playground is to debug the Depth First Search algorithm for a SAT problem. We will create a Sat problem and send it to WalkSat algorithm to solve it. After will send the problem to the Depth First Search algorithm to solve it. Finally we will compare the results.
// List<List<int>> problem = List.generate(M, (i) => List.filled(K, 0));
// problem = newProblem(problem);

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'depth_first.dart';
import 'new_value.dart';
import 'walk_sat.dart';

myFunction() async {
  print('Started');

  N = 12;
  M = 17;
  K = 6;

  List<List<int>> problem = [
    // [1, -2],
    // [1, 2],
    // [-1],
    [7, 1, -5, -6, -2, 3],
    [5, -7, 2, 6, 9, 4],
    [11, -3, 9, 12, -8, -7],
    [-7, 3, 12, -1, 4, 11],
    [6, -7, -9, 2, -3, 10],
    [-5, 8, -11, -2 - 3, 1],
    [7, 1, -12, -11, 10, 6],
    [-1, -6, 11, 10, -9, 2],
    [3, 6, 1, 12, -8, 4],
    [-8, 2, 11, -4, -12, -5],
    [12, -5, -3, 4, -8, 9],
    [4, 6, 3, 10 - 9, 2],
    [-9, 7, 6, -11, -1, -4],
    [-5, -12, 8, 9, 1, -11],
    [12, -3, 6, -8, 9, 2],
    [1, 3, -2, -4, 12, -10],
    [-10, 9, 11, -2, 3, 7],
  ];

  Search searchObject = await walkSat(problem);
  print(searchObject.win);

  Search searchObject2 = await depthFirst(problem);
  print(searchObject2.win);

  print('Ended');
}
