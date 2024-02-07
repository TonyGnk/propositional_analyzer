// ignore_for_file: avoid_print

import 'dart:math';

import '../Screens/Search/Search Share/track.dart';
import '../Services/global_variables.dart';
import '../al2.dart';

walkSat(List<List<int>> problem) async {
  final Random random = Random();
  int randomIndex, randomClauseIndex, randomVariable, randomVariableIndex;
  bool currentValue;
  List<int> randomClause;
  DateTime t1 = DateTime.now();

  //Create a random assignment of true and false to the variables
  print('The walkSat is started!');
  var solution = List.generate(N, (index) => random.nextBool());
  while (true) {
    //await Future.delayed(Duration(seconds: 3), () {});
    await Future.delayed(Duration.zero, () {});
    DateTime t = DateTime.now();
    if (t.difference(t1).inSeconds > timeOut) {
      DateTime t2 = DateTime.now();
      return Search(
        win: false,
        time: t2.difference(t1).inSeconds,
      );
    }

    //Collect all the unmet indexes in a list
    final List<int> unmetClauses = findUnmetIndexes(solution, problem);
    if (unmetClauses.isEmpty) {
      return Search(
        win: true,
        time: t.difference(t1).inSeconds,
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
