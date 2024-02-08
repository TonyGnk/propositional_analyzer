//The purpose of this playground is to debug the Depth First Search algorithm for a SAT problem. We will create a Sat problem and send it to WalkSat algorithm to solve it. After will send the problem to the Depth First Search algorithm to solve it. Finally we will compare the results.

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'depth_first.dart';
import 'new_value.dart';
import 'walk_sat.dart';

myFunction() async {
  print('Started');

  N = 12;
  M = 41; //23;
  K = 6;

  // List<List<int>> problem = [
  //   // [1, -2],
  //   // [1, 2],
  //   // [-1],

  //   // [7, 1, -5, -6, -2, 3],
  //   // [5, -7, 2, 6, 9, 4],
  //   // [11, -3, 9, 12, -8, -7],
  //   // [-7, 3, 12, -1, 4, 11],
  //   // [6, -7, -9, 2, -3, 10],
  //   // [-5, 8, -11, -2 - 3, 1],
  //   // [7, 1, -12, -11, 10, 6],
  //   // [-1, -6, 11, 10, -9, 2],
  //   // [3, 6, 1, 12, -8, 4],
  //   // [-8, 2, 11, -4, -12, -5],
  //   // [12, -5, -3, 4, -8, 9],
  //   // [4, 6, 3, 10 - 9, 2],
  //   // [-9, 7, 6, -11, -1, -4],
  //   // [-5, -12, 8, 9, 1, -11],
  //   // [12, -3, 6, -8, 9, 2],
  //   // [1, 3, -2, -4, 12, -10],
  //   // [-10, 9, 11, -2, 3, 7],
  //   // [1, 2, 3, 4, 5, 6],
  //   // [7, 8, 9, 10, 11, 12],
  //   // [-2, -3, -4, -5, -6, -7],
  //   // [-2, 9, 10, 11, 12, 1],
  //   // [3, 4, 5, 6, 7, 8],
  //   // [1, 8, -4, 2, 5, -12]

  //   [-9, -8, -1, -5, 2, 4],
  //   [5, 2, 4, 8, 12, -11],
  //   [8, 11, -2, 1, 12, 4],
  //   [-10, 3, 6, 7, -5, 1],
  //   [8, 4, 11, 10, 2, -9],
  //   [-10, -4, 6, 3, -11, -12],
  //   [1, 7, -3, 5, 10, 6],
  //   [-10, 7, 2, -4, -3, 12],
  //   [6, -7, -9, 10, -1, 12],
  //   [-9, 7, 12, -3, -11, -5],
  //   [-6, 4, -5, -10, -2, 1],
  //   [-2, 6, 10, 7, 9, 1],
  //   [2, 11, -4, -7, 1, -12],
  //   [6, 11, -4, -5, 3, 12],
  //   [-11, 6, -2, 9, -7, -8],
  //   [8, -6, 2, 5, -3, 9],
  //   [10, 9, 4, 2, 8, -12],
  //   [3, 5, -7, -6, -11, -12],
  //   [-2, 6, 1, -7, 5, -9],
  //   [12, 5, 4, 3, -1, -10],
  //   [-3, -6, 8, -11, 1, -4],
  //   [9, 10, -5, -11, -7, -6],
  //   [-4, 5, 9, 3, -2, -10],
  //   [10, 2, -9, -3, -4, 1],
  //   [3, -2, 10, 8, -9, 6],
  //   [-9, 1, 11, 7, -2, -3],
  //   [-9, 10, 7, 5, 6, -3],
  //   [-9, -3, 1, -10, -8, 12],
  //   [-3, -11, -2, 7, 8, 5],
  //   [2, -8, 6, 11, 5, -3],
  //   [8, 12, -10, -11, -2, 9],
  //   [-1, 7, 10, -2, -9, -11],
  //   [-11, 12, 7, -8, 3, -2],
  //   [6, -8, -4, -2, -9, -3],
  //   [9, 4, 7, 8, -5, 6],
  //   [4, 12, -8, -11, 10, -1],
  //   [6, 1, -4, -5, 11, 12],
  //   [3, -11, 5, 1, 7, 2],
  //   [1, 12, 11, 4, 9, 8],
  //   [-1, 9, 12, 8, 2, -3],
  //   [-4, 11, 7, 9, 8, 10]
  // ];

  List<List<int>> problem = newProblem();
  Search searchObject = await walkSat(problem);
  print(searchObject.win);

  Search searchObject2 = await depthFirst(problem);
  print(searchObject2.win);

  print('Ended');
}
