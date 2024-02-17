//The purpose of this playground is to debug the Depth First Search algorithm for a SAT problem. We will create a Sat problem and send it to WalkSat algorithm to solve it. After will send the problem to the Depth First Search algorithm to solve it. Finally we will compare the results.

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'depth_first.dart';
import 'dpll.dart';
import 'new_value.dart';

myFunction() async {
  N = 3; //12;
  M = 22; //400; //23;
  K = 3; //6;

  //List<List<int>> problem = [
  // [10, -2, -11, -6, -1, -7],
  // [-1, 11, -12, -4, 7, -9],
  // [-6, -8, -11, -7, -4, -1],
  // [11, 5, -7, 1, -4, -9],
  // [11, -8, 12, 2, 7, 4],
  // [10, -8, 9, 2, -5, -7],
  // [-8, 3, -7, -9, -11, 2],
  // [1, 8, 6, 9, 10, -12],
  // [-2, 7, 11, -1, 12, 6],
  // [-9, 8, 2, -7, -6, 1],
  // [-9, 2, 11, 5, 10, -8],
  // [-3, -5, 11, 2, 9, -6],
  // [-4, 2, 1, -8, 3, 12],
  // [-11, -6, -10, -12, 2, 8],
  // [12, 8, 11, -4, -9, 3],
  // [5, -11, 10, -9, 6, 12],
  // [-10, 3, 4, -9, -7, 8],
  // [-3, 10, 7, -5, -12, -2],
  // [-1, -3, 6, 11, 7, -10],
  // [-1, 11, 3, -8, 12, -10],
  // [4, 1, -11, 6, -2, -7],
  // [-9, -4, 5, -2, -6, 12],
  // [-7, 9, -5, 8, 1, -11],
  // [7, -6, -12, 1, -10, -8],
  // [2, -6, -8, -1, 12, -11],
  // [11, 6, 2, 3, 5, -9],
  // [-12, 10, 8, 3, 9, -2],
  // [4, -2, -3, -10, 6, -11],
  // [8, 9, -7, 12, 2, -10],
  // [-11, 10, -1, -12, 4, -5],
  // [6, -4, -2, 1, 9, -8],
  // [9, 11, 7, 10, -12, -4],
  // [12, 10, 5, 8, -2, 7],
  // [1, 10, 3, -8, 5, 9],
  // [-1, 5, 3, 6, -9, 10],
  // [6, 7, -9, -4, -2, -10],
  // [-7, -5, -3, -4, 2, -12],
  // [-11, 3, 2, -6, 4, -10],
  // [10, -6, 4, -1, 9, 11],
  // [-11, 2, -9, -7, 4, -1],
  // [-5, 6, 7, -8, -3, -10],
  // [10, -6, -4, -1, 7, 2],
  // [8, 4, -2, -1, -3, -5],
  // [-10, -1, -6, 9, -11, 12],
  // [11, 8, -12, -9, 5, 4],
  // [-8, -6, 12, 10, 1, -2],
  // [1, -6, 7, -11, 9, 2],
  // [8, -6, 2, -5, 3, 10],
  // [-6, -3, 10, -2, 5, 7],
  // [-5, 11, 6, 2, -10, -3],
  // [-10, 4, 9, -6, 5, 8],
  // [-2, -8, 5, 7, -4, 3],
  // [7, 12, 9, 1, -4, -3],
  // [-10, -1, -6, -12, 8, 9],
  // [-5, 4, -11, -7, 8, 12],
  // [7, 3, 4, -2, 11, -10],
  // [11, -6, -4, -8, -7, 12],
  // [1, -9, 2, 10, 3, 12],
  // [6, 1, -10, -3, 5, 7],
  // [-8, 9, -10, 3, 5, 4],
  // [-7, 2, 4, 9, -5, -6],
  // [4, -10, -5, 9, 6, 7],
  // [-1, -2, -5, 4, 8, -6],
  // [7, -9, 10, -1, -5, -4],
  // [-5, -4, -12, -1, -9, 6],
  // [-1, 4, 12, 3, -6, 11],
  // [-3, 8, 2, 11, 5, 9],
  // [7, -5, -10, 6, -2, 3],
  // [1, 6, 3, -4, -9, 11],
  // [-10, 12, 2, 4, 6, 1],
  // [-9, -2, -3, -6, -11, 1],
  // [-8, 6, 12, 9, 11, 10],
  // [-6, -3, -12, 9, 7, -8],
  // [4, -8, -1, -7, 10, -6],
  // [12, 1, -3, 10, -5, 4],
  // [-8, -11, 1, -3, -10, 4],
  // [7, 5, -10, -3, -6, 9],
  // [8, 3, -7, 11, 1, -9],
  // [-12, 6, 5, -3, 9, 8],
  // [1, 5, -9, -2, -7, -6],
  // [3, -1, 7, -6, -12, 9],
  // [-7, 10, 3, -12, 1, 5],
  // [5, -3, -1, 12, -2, 6],
  // [4, 12, 1, -3, -9, 2],
  // [7, 4, -5, -6, -1, 3],
  // [9, 7, 12, -6, 10, 2],
  // [-11, -2, -10, -6, 8, 5],
  // [-11, -3, -4, -10, -2, 1],
  // [1, 7, -6, -5, 12, 2],
  // [11, 3, 9, 5, 12, -4],
  // [-12, -6, -11, 4, 5, 8],
  // [8, 12, -5, -4, -9, -2],
  // [11, -10, 9, 3, -4, 8],
  // [-1, -11, 5, -3, -6, -10],
  // [12, -11, 2, -1, 4, -8],
  // [7, -3, -8, -2, -9, 4],
  // [12, 5, -4, 10, 11, -3],
  // [-10, 12, -5, 6, 7, 1],
  // [-4, -7, 8, 9, -1, 6],
  // [-7, -12, 8, 5, -10, 11],
  // [-10, -3, -1, -4, 8, -11],
  // [-6, 7, 12, -11, -5, -10],
  // [9, -11, 10, 4, 6, -12],
  // [3, 1, -5, 7, -12, 11],
  // [4, 3, -5, -1, 10, -8],
  // [-12, -3, 9, 5, -8, 6],
  // [-7, 2, 4, -6, 10, -3],
  // [1, 5, -3, 4, -9, -6],
  // [2, -8, 1, -5, -7, -10],
  // [-5, 11, 3, 8, -1, -2],
  // [-6, 5, -10, 11, 4, -12],
  // [11, -2, 4, 8, -9, 12],
  // [-4, -2, 6, 11, 7, -12],
  // [-11, 3, 10, 2, 7, -1],
  // [8, 6, 4, -2, -5, -12],
  // [5, 11, 2, -8, -12, -9],
  // [5, -12, -11, -2, 3, -10],
  // [12, -3, -7, 8, 9, -10],
  // [-2, 11, 8, 10, -3, -7],
  // [4, -3, -5, -10, -2, -7],
  // [-2, -6, 3, 9, 10, -5],
  // [-8, -1, -5, 2, 10, -9],
  // [-9, -6, 3, 4, -5, 2],
  // [5, -10, 8, 3, -11, 1],
  // [-5, -3, 7, 10, -1, -8],
  // [4, 12, 9, 7, 2, -8],
  // [10, -2, -3, 7, -5, -6],
  // [-6, 4, 10, 5, -12, -2],
  // [3, 6, -7, -10, -11, -1],
  // [-11, 2, -3, 6, -10, -8],
  // [8, -10, 3, -6, 2, 11],
  // [5, -7, -10, -2, -8, 9],
  // [-5, 8, 7, 9, -10, 3],
  // [-7, 5, 12, 4, 3, 11],
  // [-2, -10, -3, 5, -4, -7],
  // [2, 8, -10, -7, 4, -3],
  // [9, -11, -6, -4, 1, -3],
  // [6, -7, 4, 11, 1, 5],
  // [12, -7, 9, -2, 11, 6],
  // [-4, -9, 6, -7, 8, 12],
  // [1, 11, -3, -9, 4, -7],
  // [-2, 9, -7, -6, 11, 10],
  // [4, 1, -7, 2, -10, 11],
  // [-6, -12, 2, 7, -8, -1],
  // [-9, 4, 3, -11, -6, 12],
  // [5, 1, 3, -11, 9, 8],
  // [12, -3, 4, -2, -10, 6],
  // [-5, -10, -7, 6, 3, -2],
  // [-9, -6, -8, -2, -4, -7],
  // [-3, 6, 10, -9, -11, -5],
  // [-12, -7, -6, -9, 3, -8],
  // [-4, 1, -5, -12, 9, 3],
  // [6, -8, 12, 9, -3, 10],
  // [-3, -1, 8, 5, 6, -9],
  // [4, -2, -11, 7, 5, -12],
  // [11, -3, 9, -7, 2, 1],
  // [6, 5, -4, 8, -1, 9],
  // [-12, -8, 9, -7, -1, -5],
  // [10, -7, -2, 12, 1, -4],
  // [9, 3, 10, 6, -8, -11],
  // [-8, 6, 12, 9, -1, 11],
  // [12, 3, 11, -9, -1, -7],
  // [-5, -7, -12, -10, -1, 8],
  // [7, -9, -12, 3, 4, -10],
  // [2, -8, 10, 3, 6, -9],
  // [-1, 9, 12, 3, 4, -5],
  // [11, 5, -8, 4, -2, 7],
  // [-11, -9, -4, -12, -5, 10],
  // [-4, 3, -8, -2, 9, -1],
  // [4, -11, -7, -5, 12, 10],
  // [12, 7, -3, 4, -2, 6],
  // [12, -11, 1, -4, 3, -2],
  // [-1, 10, 6, -4, -8, -3],
  // [9, -6, 10, 11, -7, -12],
  // [-8, -6, 4, 2, 1, 7],
  // [-5, -11, 8, 2, 12, 6],
  // [4, 9, 2, -6, -12, 7],
  // [4, -7, 3, 11, 5, -2],
  // [-3, 11, 7, -10, -1, -2],
  // [4, 1, 3, 11, -9, 8],
  // [5, -3, -6, 9, -11, 1],
  // [-4, -1, -2, 10, 5, 9],
  // [5, 9, 11, -2, 8, 1],
  // [11, -10, 4, -12, -3, -6],
  // [-3, 1, 4, -9, -2, -8],
  // [1, -2, -4, 12, -10, -8],
  // [11, 12, 9, 3, -5, 1],
  // [4, 7, 6, 10, -11, 1],
  // [-6, 7, -4, -2, -5, -10],
  // [-4, -6, 12, -7, -9, -1],
  // [11, -10, 9, 5, 7, -2],
  // [-5, 10, -7, -1, 6, -11],
  // [-4, 1, 8, 12, -5, 11],
  // [7, 2, -12, -1, -11, 6],
  // [3, 1, -2, 11, -10, -4],
  // [8, 3, -7, 5, -2, 4],
  // [2, 6, -9, -4, -5, -10],
  // [-9, -12, 5, -8, 7, -10],
  // [-8, -6, -7, -10, 3, 5],
  // [10, -6, -11, 4, 1, 9],
  // [-11, 1, -10, 6, -2, -7],
  // [3, -8, 10, -7, -12, 1],
  // [-9, 5, 7, 4, 8, 1],
  // [8, -9, 12, 2, 6, -3],
  // [11, -4, 1, -10, 3, 5],
  // [8, -11, 4, -1, -6, 7],
  // [-9, 12, -7, -11, 10, 4],
  // [-3, -12, -6, -8, 1, -10],
  // [1, 7, 8, 4, -12, 6],
  // [-6, 2, 4, -11, -10, 3],
  // [-8, 11, 6, 10, 3, -7],
  // [-12, 11, -1, 6, -10, 3],
  // [6, 2, 4, -7, -8, 9],
  // [-8, -1, -6, -4, 11, -12],
  // [-2, 9, 5, 1, -4, -12],
  // [11, -5, -12, -9, -2, -7],
  // [11, -9, -5, -2, -1, 10],
  // [5, -3, -9, 11, -4, -10],
  // [-11, 8, -4, -10, 6, -3],
  // [12, 3, -6, 2, 9, 4],
  // [-9, 2, -10, -4, -8, -12],
  // [-5, -2, 12, 7, -4, -1],
  // [8, -3, 9, 12, -5, 10],
  // [-10, 4, 8, 5, 2, 7],
  // [12, 5, -1, 7, 6, -9],
  // [3, 10, -8, -1, -12, 6],
  // [1, 5, 4, 11, -7, -6],
  // [2, -10, -3, -11, -7, -1],
  // [6, -1, -3, -5, 10, -2],
  // [-9, 5, -10, 3, -2, 4],
  // [11, -1, 4, -9, -10, -8],
  // [3, 9, 10, -5, 11, 1],
  // [11, -3, -4, -1, -5, -9],
  // [7, 11, 9, -12, -3, -2],
  // [5, -8, -11, 1, 3, -6],
  // [-7, 12, 5, -1, -2, 3],
  // [9, 11, -8, 6, -2, 12],
  // [-5, -12, 2, 4, -7, 8],
  // [2, 9, 10, -7, -3, -8],
  // [-4, -3, 11, -5, -6, 12],
  // [12, -10, 5, -11, 9, -3],
  // [-11, 9, -12, 7, -2, -6],
  // [-9, 6, 4, -11, -12, -1],
  // [-3, 10, 9, -11, 7, 5],
  // [-8, -12, -6, -9, -10, -7],
  // [-4, 12, 7, -11, 3, 2],
  // [-5, -3, 4, 9, 11, 1],
  // [-12, 3, 11, 2, 4, 8],
  // [3, -7, 11, -8, -9, 1],
  // [-11, 7, -3, 12, -9, -4],
  // [-11, -2, 7, -10, -5, 9],
  // [5, 2, 4, 3, 7, -11],
  // [9, 8, 3, -2, 6, -12],
  // [5, -8, -2, 9, 12, 10],
  // [-6, 7, 10, -8, -4, -3],
  // [9, 1, -12, -11, 10, 6],
  // [1, -7, -10, -3, -5, -12],
  // [2, 8, -11, 4, -12, 7],
  // [4, -10, -9, -1, -2, -12],
  // [-1, -8, -9, 6, 2, -12],
  // [-8, -6, -5, 1, -9, -12],
  // [-4, -8, 1, 2, 5, 11],
  // [12, 1, 3, 10, 2, 8],
  // [2, -6, 1, -7, 3, 9],
  // [2, -9, 4, 12, 11, 1],
  // [-3, 5, -2, -1, -6, 7],
  // [1, 6, 5, 11, -4, -3],
  // [4, -7, -9, -5, -11, -12],
  // [9, -12, 10, 4, -6, -11],
  // [-11, 4, 5, -6, -9, 8],
  // [2, 6, 7, 8, 11, -1],
  // [2, 9, -11, 6, 1, 4],
  // [-5, 2, 3, -1, 8, 6],
  // [-1, 3, 11, -5, -6, 9],
  // [12, -6, -11, -10, -9, 1],
  // [-4, -3, 9, -7, 2, -10],
  // [2, 10, -3, 11, -9, 12],
  // [7, -11, 3, 8, -9, -6],
  // [2, -6, 10, 5, -3, -12],
  // [11, -6, -3, -12, -9, -8],
  // [4, -9, -10, -12, -8, 7],
  // [-2, -12, 3, 5, 9, -7],
  // [-7, -8, -12, 3, 6, 2],
  // [10, -2, -12, -8, -6, -4],
  // [4, 3, 1, 6, -11, 8],
  // [6, 3, 5, -7, -8, -12],
  // [5, 3, -11, -12, 10, -7],
  // [2, -9, -3, 6, 8, 4],
  // [9, -10, 1, 2, 7, 5],
  // [8, -12, 9, -4, -10, 3],
  // [6, -9, 7, 10, -3, -2],
  // [12, -11, -7, -2, -10, 5],
  // [-2, 3, -9, -6, 10, 7],
  // [8, 1, 5, 4, -11, 12],
  // [8, -2, -4, -3, -6, -10],
  // [-11, -1, 5, 7, -3, -6],
  // [3, 7, 4, -5, 11, 6],
  // [-6, -2, -1, 4, 8, -9],
  // [-9, -3, -5, -12, -7, 1],
  // [7, 4, -3, 10, -12, -5],
  // [-11, -6, 1, 7, -9, 8],
  // [8, 3, -1, 2, -9, -6],
  // [-7, 12, 6, -11, 2, -1],
  // [1, -4, 3, 9, -5, 10],
  // [-12, -4, 2, -11, 8, -3],
  // [-3, -5, 6, -10, -1, -12],
  // [8, 3, -7, -2, -11, 1],
  // [-10, 12, 6, -7, 8, -5],
  // [-12, -2, 8, -7, 5, 3],
  // [9, 8, 6, 7, 3, -12],
  // [4, -1, 8, -10, -9, 6],
  // [-4, 3, -9, -1, -5, 2],
  // [11, 1, 5, 10, -2, -7],
  // [-10, 6, 12, 9, 11, -7],
  // [10, -2, 6, 11, 4, -1],
  // [1, 9, -10, 2, 4, -6],
  // [10, -5, -7, -2, 6, 12],
  // [-3, 10, 8, -5, 7, 1],
  // [5, -4, -12, -6, 7, 11],
  // [2, 7, 9, 8, -4, -5],
  // [5, 1, -9, 8, 3, 10],
  // [2, -3, 12, -6, 7, 4],
  // [-7, -3, -6, -11, 2, -5],
  // [-6, 7, -12, 5, -1, 2],
  // [-3, 11, -12, -7, -2, 1],
  // [11, 3, 10, -7, -5, 4],
  // [6, -3, -8, 11, -9, -1],
  // [10, -5, -1, 11, -7, 2],
  // [6, -12, 8, -1, -10, -3],
  // [-10, 11, 1, 8, -12, -3],
  // [-4, -7, 9, 11, -1, 12],
  // [-11, 4, -2, 3, -1, -9],
  // [10, -1, -3, -2, 5, 6],
  // [3, 4, 7, -5, 11, -2],
  // [3, 8, 1, -12, -5, 4],
  // [-10, -12, -1, -7, 5, 9],
  // [6, 10, 9, 5, 12, 3],
  // [5, 11, 2, -3, 8, -1],
  // [7, 11, -8, -4, 6, 1],
  // [-9, -10, 1, -8, 4, 2],
  // [1, -9, 8, -6, -3, -2],
  // [-7, 8, 5, -2, 12, 3],
  // [10, -2, -4, -6, 12, -11],
  // [-10, -6, 7, 8, 1, -5],
  // [-10, 7, -3, -2, 1, -4],
  // [7, -8, 4, -10, -3, 11],
  // [-11, 5, -1, 3, 7, -12],
  // [5, -8, 12, 1, 7, 10],
  // [-3, 1, -10, -9, 12, -4],
  // [5, -7, 4, -6, 1, 11],
  // [-6, -4, -12, -10, -2, 5],
  // [8, 5, 7, -9, 1, -2],
  // [-8, 1, 2, -12, -9, -7],
  // [-5, -10, -12, 11, 1, 4],
  // [-1, -5, 7, 6, -9, 8],
  // [-9, -4, 10, 12, 2, -8],
  // [9, -11, -12, -7, 5, 2],
  // [9, 1, 4, -2, -5, 3],
  // [-7, -4, 9, -10, -12, 8],
  // [-2, -5, 1, 3, 12, -7],
  // [-11, -10, 4, 7, -6, -1],
  // [8, -5, -4, 10, 3, -9],
  // [1, -11, 12, -8, -5, -6],
  // [-9, 10, -11, -12, -6, 3],
  // [-9, 10, 11, -8, 1, -7],
  // [9, 10, -8, -4, -5, 1],
  // [12, 7, -6, -11, -10, 5],
  // [-7, 6, -9, -12, 4, -5],
  // [4, -7, 12, 6, -1, 8],
  // [1, -6, -4, 5, -8, -11],
  // [-1, -11, -4, -3, -12, 5],
  // [-11, 4, 5, -10, 3, -12],
  // [-5, 6, -4, -11, 2, -1],
  // [3, -12, -4, -7, -2, 8],
  // [-8, 6, -3, -10, 12, 2],
  // [-10, 9, 12, -11, 5, 1],
  // [-10, 1, -2, 7, 5, 6],
  // [-3, 12, 10, -4, 1, -11],
  // [10, 2, -11, -8, -1, 4],
  // [7, -9, 3, -11, 4, -10],
  // [-7, -5, 2, 4, -11, -8],
  // [5, 10, 4, -8, -11, 6],
  // [-6, -5, 4, 11, -10, 1],
  // [-10, -12, -5, -6, 1, 7],
  // [-1, -12, 9, 3, -4, -2],
  // [-7, -2, 12, 5, 9, 11],
  // [-8, 3, -1, -4, 5, 12],
  // [-11, -2, -5, -8, 9, 6],
  // [-12, -5, 6, 11, 1, -7],
  // [-3, 10, -2, -12, 8, 5],
  // [-5, 7, 8, -3, 10, 6],
  // [-5, 11, 4, 6, 3, -8],
  // [-3, 10, -7, -11, -12, 9],
  // [-8, 4, 3, -6, 11, -2],
  // [9, -3, 4, 11, -1, -7],
  // [-4, -8, 6, -11, -3, -5],
  // [1, 10, 6, 9, 2, 7],
  // [-1, 9, 12, -3, -8, 2],
  // [-8, -1, 11, -4, 3, -7],
  // [11, -5, -8, 1, 10, -7],
  //_____
  // [1, -2],
  // [1, 2],
  // [-1],
  //____

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
  //];

  List<List<int>> problem1 = newProblem();
  List<List<int>> problem2 = newProblem();
  List<List<int>> problem3 = newProblem();
  List<List<int>> problem4 = newProblem();
  List<List<int>> problem5 = newProblem();
  //print(problem);
  // Search searchObject = await walkSat(problem);
  // print(searchObject.win);

  Search searchDepth1 = await depthFirst(problem1);
  Search searchDepth2 = await depthFirst(problem2);
  Search searchDepth3 = await depthFirst(problem3);
  Search searchDepth4 = await depthFirst(problem4);
  Search searchDepth5 = await depthFirst(problem5);

  Search searchDpll1 = await solveWithDpll(problem1);
  Search searchDpll2 = await solveWithDpll(problem2);
  Search searchDpll3 = await solveWithDpll(problem3);
  Search searchDpll4 = await solveWithDpll(problem4);
  Search searchDpll5 = await solveWithDpll(problem5);

  //Times
  if (searchDpll1.win) {
    print('Problem: 1');
    print('Dpll 1 Time: ${searchDpll1.time}');
    print('Depth first 1 Time: ${searchDepth1.time}');
  }

  if (searchDpll2.win) {
    print('\nProblem: 2');
    print('Dpll 2 Time: ${searchDpll2.time}');
    print('Depth first 2 Time: ${searchDepth2.time}');
  }

  if (searchDpll3.win) {
    print('\nProblem: 3');
    print('Dpll 3 Time: ${searchDpll3.time}');
    print('Depth first 3 Time: ${searchDepth3.time}');
  }

  if (searchDpll4.win) {
    print('\nProblem: 4');
    print('Dpll 4 Time: ${searchDpll4.time}');
    print('Depth first 4 Time: ${searchDepth4.time}');
  }

  if (searchDpll5.win) {
    print('\nProblem: 5');
    print('Dpll 5 Time: ${searchDpll5.time}');
    print('Depth first 5 Time: ${searchDepth5.time}');
  }
}
