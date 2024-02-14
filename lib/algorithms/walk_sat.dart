// ignore_for_file: avoid_print

import 'dart:math';

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'al2.dart';

walkSat(List<List<int>> problem) async {
  final Random random = Random();
  int randomIndex, randomClauseIndex, randomVariable, randomVariableIndex;
  bool currentValue;
  List<int> randomClause;
  DateTime t1 = DateTime.now();

  //Create a random assignment of true and false to the variables
  var solution = List.generate(N, (index) => random.nextBool());
  // await Future.delayed(Duration(seconds: 2), () {});
  while (true) {
    await Future.delayed(Duration.zero, () {});
    DateTime time = DateTime.now();
    if (time.difference(t1).inSeconds > timeOut) {
      return const Search(win: false);
    }

    //Collect all the unmet indexes in a list
    final List<int> unmetClauses = findUnmetIndexes(solution, problem);
    if (unmetClauses.isEmpty) {
      return Search(
        win: true,
        time: time.difference(t1).inMilliseconds,
      );
    }

    randomIndex = random.nextInt(unmetClauses.length);
    randomClauseIndex = unmetClauses[randomIndex];
    randomClause = problem[randomClauseIndex]; // [1, -2]

    //Randomly select a variable from the clause like 1 or -2
    randomVariable = random.nextInt(randomClause.length);
    randomVariableIndex = randomClause[randomVariable];

    currentValue = solution[randomVariableIndex.abs() - 1];
    solution[randomVariableIndex.abs() - 1] = !currentValue;
  }
}
