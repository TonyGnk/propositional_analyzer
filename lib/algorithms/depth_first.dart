import 'dart:core';

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'al2.dart';
import 'generate_children.dart';
import 'solution_dart.dart';

//StackItem head = StackItem();
List<List<bool?>> stackItems = [];

depthFirst(List<List<int>> problem) async {
  DateTime startTime, nowTime;
  int steps = 0;
  int stepsUnmet = 0;

  var vector = List<bool?>.filled(N, null);
  stackItems.clear();
  //head.push(vector);
  //Add at the start
  stackItems.insert(0, vector);
  startTime = DateTime.now();

  // for (var i = 0; i < head.items.length; i++) {
  //   print('Stack: $i ${head.items[i]}');
  // }
  print('Stack: $stackItems');

  print('\n');

  // While the stack is not empty.. repeat
  while (stackItems.isNotEmpty) {
    //remove from the start
    vector = stackItems.removeAt(0);
    //vector = head.pop()!;
    //print('New Vector: $vector');

    steps++;
    print('Step: $steps');
    nowTime = DateTime.now();
    await Future.delayed(Duration.zero, () {});
    if (nowTime.difference(startTime).inSeconds > timeOut) {
      print('Time out in Depth First Search');
      return const Search(win: false);
    }

    if (complete(vector)) {
      if (valid(vector, problem)) {
        print('Solution: $vector');
        return Search(
          win: true,
          time: nowTime.difference(startTime).inSeconds,
        );
      }
      // List<bool> completeVector = vector.map((e) => e ?? false).toList();
      // final List<int> unmetClauses = findUnmetIndexes(completeVector, problem);
      // print('Unmet Clauses: $unmetClauses');
      // stepsUnmet++;
      // if (unmetClauses.isEmpty) {
      //   print('Solution: $completeVector');
      //   return Search(
      //     win: true,
      //     time: nowTime.difference(startTime).inSeconds,
      //   );
      // }
    } else {
      generateChildren(vector, problem);
    }

    //Display all the vectors in the stack
    // for (var i = 0; i < stackItems.length; i++) {
    //   print('Stack: $i ${stackItems[i]}');
    // }

    //wait 2sec for the next step
    //await Future.delayed(const Duration(seconds: 9), () {});
  }
  print('Unmet Steps: $stepsUnmet');
  print('Steps: $steps');
  return const Search(win: false);
}

//_____________________________________________________________________

class StackItem {
  StackItem();

  final List<List<bool?>> items = [];

  void push(List<bool?> newItem) {
    items.add(newItem);
  }

  List<bool?>? pop() {
    if (items.isNotEmpty) {
      return items.removeLast();
    } else {
      return null;
    }
  }

  void clear() {
    items.clear();
  }

  bool get isNotEmpty => items.isNotEmpty;
}
