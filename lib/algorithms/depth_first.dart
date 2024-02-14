import 'dart:core';

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'generate_children.dart';
import 'solution_dart.dart';

List<List<bool?>> stackItems = [];

depthFirst(List<List<int>> problem) async {
  DateTime startTime, nowTime;

  var vector = List<bool?>.filled(N, null);
  stackItems.clear();
  stackItems.insert(0, vector);
  startTime = DateTime.now();

  // While the stack is not empty.. repeat
  while (stackItems.isNotEmpty) {
    vector = stackItems.removeAt(0);

    nowTime = DateTime.now();
    await Future.delayed(Duration.zero, () {});
    if (nowTime.difference(startTime).inSeconds > timeOut) {
      //print('Time out in Depth First');
      return const Search(win: false);
    }

    if (complete(vector)) {
      if (valid(vector, problem)) {
        //print('The solution is: $vector');
        return Search(
          win: true,
          time: nowTime.difference(startTime).inMilliseconds,
        );
      }
    } else {
      generateChildren(vector, problem);
    }

    //await Future.delayed(const Duration(seconds: 2), () {});
  }
  return const Search(win: false);
}
