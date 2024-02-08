import 'dart:core';

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'al2.dart';
import 'generate_children.dart';
import 'solution_dart.dart';

StackItem head = StackItem();

depthFirst(List<List<int>> problem) async {
  DateTime startTime, nowTime;

  var vector = List<bool?>.filled(N, null);
  head = StackItem();
  head.push(vector);
  startTime = DateTime.now();

  // While the stack is not empty.. repeat
  while (head.isNotEmpty) {
    nowTime = DateTime.now();
    await Future.delayed(Duration.zero, () {});
    if (nowTime.difference(startTime).inSeconds > timeOut) {
      return const Search(win: false);
    }

    if (complete(vector)) {
      List<bool> completeVector = vector.map((e) => e ?? false).toList();
      final List<int> unmetClauses = findUnmetIndexes(completeVector, problem);
      if (unmetClauses.isEmpty) {
        return Search(
          win: true,
          time: nowTime.difference(startTime).inSeconds,
        );
      }
    } else {
      generateChildren(vector, problem, M);
    }

    vector = head.pop()!;
  }
  return const Search(win: false);
}

//_____________________________________________________________________

class StackItem {
  StackItem();

  final List<List<bool?>> _items = [];

  void push(List<bool?> newItem) {
    _items.add(newItem);
  }

  List<bool?>? pop() {
    if (_items.isNotEmpty) {
      return _items.removeLast();
    } else {
      return null;
    }
  }

  bool get isNotEmpty => _items.isNotEmpty;
}
