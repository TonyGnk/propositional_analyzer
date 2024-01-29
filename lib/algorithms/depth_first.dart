// ignore_for_file: avoid_print

/*
	Solving the Propositional (Boolean) Satisfiability problem
	using Depth-First Search.

	Ioannis Refanidis, 2009
*/

import 'dart:io';
import 'dart:math';
import 'dart:core';

const TIMEOUT = 60; // Program terminates after TIMEOUT secs

int N = 0; // Number of propositions
int M = 0; // Number of sentences
int K = 0; // Number of propositions per sentence

List<int> problem =
    []; // This is a list to keep all the sentences of the problem

// Class used for the stack of the depth-first search algorithm
class StackItem {
  StackItem({required this.vector, this.next});

  List<int> vector;
  StackItem? next;
}

// The head of the stack
StackItem? head;

int readFile(String filename) {
  try {
    // Opening the input file
    var file = File(filename);
    var lines = file.readAsLinesSync();

    if (lines.isEmpty) {
      print('Cannot open input file. Now exiting...');
      return -1;
    }

    // Reading the number of propositions
    N = int.tryParse(lines.removeAt(0)) ?? -1;
    if (N < 1) {
      print('Cannot read the number of propositions. Now exiting...');
      return -1;
    }

    // Reading the number of sentences
    M = int.tryParse(lines.removeAt(0)) ?? -1;
    if (M < 1) {
      print('Cannot read the number of sentences. Now exiting...');
      return -1;
    }

    // Reading the number of propositions per sentence
    K = int.tryParse(lines.removeAt(0)) ?? -1;
    if (K < 2) {
      print(
          'Cannot read the number of propositions per sentence. Now exiting...');
      return -1;
    }

    // Allocating memory for the sentences...
    problem = List<int>.filled(M * K, 0);

    // ...and read them
    for (var i = 0; i < M; i++) {
      for (var j = 0; j < K; j++) {
        var value = int.tryParse(lines.removeAt(0)) ?? -1;
        if (value == 0 || value > N || value < -N) {
          print(
              'Wrong value for the #${j + 1} proposition of the #${i + 1} sentence. Now exiting...');
          return -1;
        }
        problem[i * K + j] = value;
      }
    }

    return 0;
  } catch (e) {
    print('Cannot open input file. Now exiting...');
    return -1;
  }
}

void syntaxError(List<String> arguments) {
  print('Use the following syntax:\n');
  print('${arguments[0]} <method> <inputfile> <outputfile>\n');
  print('where:');
  print("<method> is either 'hill' or 'depth' (without the quotes)");
  print('<inputfile> is the name of the file with the problem description');
  print('<outputfile> is the name of the output file with the solution');
}

// Auxiliary function that displays all the sentences of the problem
void displayProblem() {
  print('The current problem:');
  print('====================');
  for (var i = 0; i < M; i++) {
    var sentence = '';
    for (var j = 0; j < K; j++) {
      if (j > 0) {
        sentence += ' or ';
      }
      if (problem[i * K + j] > 0) {
        sentence += 'P${problem[i * K + j]}';
      } else {
        sentence += 'not P${-problem[i * K + j]}';
      }
    }
    print(sentence);
  }
}

int count(List<int> vector) {
  var c = 0;
  for (var i = 0; i < M; i++) {
    var satisfied = 0;
    for (var j = 0; j < K; j++) {
      if ((problem[i * K + j] > 0 && vector[problem[i * K + j] - 1] == 1) ||
          (problem[i * K + j] < 0 && vector[-problem[i * K + j] - 1] == -1)) {
        satisfied = 1;
      }
    }
    c += satisfied;
  }
  return M - c;
}

void display(List<int> vector) {
  for (var i = 0; i < N; i++) {
    if (vector[i] == 1) {
      print('P${i + 1}=true  ');
    } else {
      print('P${i + 1}=false  ');
    }
  }
}

// Auxiliary function that copies the values of one vector to another
void copy(List<int> vector1, List<int> vector2) {
  for (var i = 0; i < N; i++) {
    vector2[i] = vector1[i];
  }
}

// This function creates a new stack node and pushes it on the top of the stack.
bool push(List<int> vector) {
  var tempVector = List<int>.from(vector);
  var temp;
  if (head != null) {
    temp = StackItem(vector: tempVector, next: head!);
  } else {
    // Handle the case when head is null
    // For example, you can create a new StackItem with next as null
    temp = StackItem(vector: tempVector, next: null);
  }
  head = temp;
  return true;
}

// Check whether a vector is a complete assignment and it is also valid.
bool valid(List<int> vector) {
  for (var i = 0; i < M; i++) {
    var satisfiable = false;
    for (var j = 0; j < K; j++) {
      if ((problem[i * K + j] > 0 && vector[problem[i * K + j] - 1] >= 0) ||
          (problem[i * K + j] < 0 && vector[-problem[i * K + j] - 1] <= 0)) {
        satisfiable = true;
      }
    }
    if (satisfiable == false) {
      return false;
    }
  }
  return true;
}

// This function checks whether a current partial assignment is already invalid.
// In order for a partial assignment to be invalid, there should exist a sentence such that
// all propositions in the sentence have already value and their values are such that
// the sentence is false.
bool solution(List<int> vector) {
  for (var i = 0; i < N; i++) {
    if (vector[i] == 0) {
      return false;
    }
  }

  return valid(vector);
}

// Given a partial assignment vector, for which a subset of the first propositions have values,
// this function pushes up to two new vectors to the stack, which concern giving to the first unassigned
// proposition the values true=1 and false=-1, after checking that the new vectors are valid.
bool generateChildren(List<int> vector) {
  int i;
  for (i = 0; i < N && vector[i] != 0; i++);

  vector[i] = -1;
  if (valid(vector)) {
    var err = push(vector);
    if (err == false) {
      return false;
    }
  }

  vector[i] = 1;
  if (valid(vector)) {
    var err = push(vector);
    if (err == false) {
      return false;
    }
  }

  return true;
}

void depthFirst() {
  var vector = List<int>.filled(N, 0);
  push(vector);

  while (head != null) {
    var temp = head;
    head = head!.next;

    if (solution(temp!.vector)) {
      print('Solution found: ${temp.vector}');
      return;
    }

    generateChildren(temp.vector);
  }

  print('No solution found');
}

void main(List<String> arguments) {
  if (arguments.length != 3) {
    print('Wrong number of arguments. Now exiting...');
    syntaxError(arguments);
    exit(-1);
  }

  var err = readFile(arguments[1]);
  if (err < 0) {
    exit(-1);
  }

  if (arguments[0] == 'depth') {
    // depthFirst(arguments);
  } else {
    syntaxError(arguments);
  }
}
