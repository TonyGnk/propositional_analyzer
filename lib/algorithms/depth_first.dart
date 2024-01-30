// ignore_for_file: avoid_print

/*
	Solving the Propositional (Boolean) Satisfiability problem
	using Depth-First Search.
*/

import 'dart:async';
import 'dart:core';

import '../Screens/Result/track.dart';
import '../constants.dart';
import 'generate_children.dart';
import 'solution_dart.dart';

StackItem head = StackItem();

depthFirst(List<List<int>> problem, int M) async {
  DateTime startTime;
  DateTime currentTime;
  DateTime endTime;
  List<int>? temp;

  var vector = List<int>.filled(N, 0);
  head = StackItem();
  head.push(vector);

  // Save the starting time
  startTime = DateTime.now();

  // While the stack is not empty.. repeat
  while (head.isNotEmpty) {
    currentTime = DateTime.now();
    if (currentTime.difference(startTime).inSeconds > timeOut) {
      print('Timeout');
      return Search(
          win: false, time: currentTime.difference(startTime).inSeconds);
    }

    // Retract the top element from the stack.
    temp = head.pop();
    if (solution(vector, problem, M)) {
      endTime = DateTime.now();
      print('Solution found: $vector');
      return Search(win: true, time: endTime.difference(startTime).inSeconds);
    } else {
      generateChildren(vector, problem, M);
    }

    //wait 3 sec
    //await Future.delayed(const Duration(seconds: 3), () {});
  }
  endTime = DateTime.now();
  print('No solution exists!');
  return Search(win: false, time: endTime.difference(startTime).inSeconds);
}

//_____________________________________________________________________

class StackItem {
  StackItem();

  List<List<int>> _items = [];

  void push(List<int> item) {
    _items.add(item);
  }

  List<int>? pop() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.removeLast();
  }

  List<int>? peek() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.last;
  }

  bool get isNotEmpty => _items.isNotEmpty;
}