import 'dart:math';

import '../Screens/Search/Search Share/track.dart';
import '../global_variables.dart';
import 'satisfaction_checker.dart';

solveWithWalkSat(List<List<int>> problem) async {
  final Random random = Random();

  int randomIndex, randomClauseIndex, randomVariable, randomVariableIndex;
  bool currentValue;
  List<int> randomClause;

  DateTime t1 = DateTime.now();

  var solution = List.generate(N, (index) => random.nextBool());

  while (true) {
    await Future.delayed(Duration.zero, () {});
    DateTime time = DateTime.now();

    //Αν ο διαθέσιμος χρόνος παρέλθει επιστρέφει αποτέλεσμα αποτυχίας
    if (time.difference(t1).inSeconds > timeOut) {
      return Search(
        win: false,
        time: time.difference(t1).inMilliseconds,
      );
    }

    //Συγκεντρώνει τις μη ικανοποιημένες προτάσεις σε μια λίστα
    final List<int> unmetClauses = findUnmetIndexes(solution, problem);

    //Αν αυτή η λίστα είναι κενή τότε όλες οι προτάσεις ικανοποιούνται και επιστρέφει αποτέλεσμα επιτυχίας
    if (unmetClauses.isEmpty) {
      return Search(
        win: true,
        time: time.difference(t1).inMilliseconds,
      );
    }

    //Δημιουργεί έναν τυχαίο αριθμό από το 0 μέχρι το μέγεθος της λίστας
    randomIndex = random.nextInt(unmetClauses.length);

    //Επιλέγει με τον τυχαίο αριθμό μια μη ικανοποιημένη πρόταση
    //Έστω ότι η λίστα είναι [1, 3, 5] και ο τυχαίος αριθμός είναι 2
    randomClauseIndex = unmetClauses[randomIndex];

    //Επιλέγει με τον τυχαίο αριθμό μια πρόταση από την πρόταση που επιλέχθηκε προηγουμένως
    randomClause = problem[randomClauseIndex];

    //Τυχαία επιλογή μεταβλητής στην πρόταση
    randomVariable = random.nextInt(randomClause.length);
    randomVariableIndex = randomClause[randomVariable];

    //Αν η τυχαία μεταβλητή είναι θετική τότε η αλλαγή της τιμή της οδηγεί σε μια καλύτερη κατάσταση (ίσως και λύση)
    currentValue = solution[randomVariableIndex.abs() - 1];
    //Εκχώρηση/Ενημέρωση της τιμής της μεταβλητής στην λύση
    solution[randomVariableIndex.abs() - 1] = !currentValue;
  }
}
