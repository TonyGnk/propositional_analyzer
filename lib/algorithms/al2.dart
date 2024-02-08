/*
A typical bool problem: 
List<List<int>> problem = [
    [1, -2],
    [2],
    [3, 1],
    [-2, -3],
  ];

    That means:
    (x1 or not x2) and (x2) and (x3 or x1) and (not x2 or not x3)

    Solution has to be a list of true and false values like this:
    [true, false, true]
  ];*/

findUnmetIndexes(List<bool> solution, List<List<int>> problem) {
  //Collect all the unsatisfied indexes in a list
  List<int> unsatisfiedClauses = [];

  //Iterate through each clause and check if it is satisfied or not
  for (var i = 0; i < problem.length; i++) {
    //This is a row in the problem like [1, -2]

    var clause = problem[i];
    var clauseSatisfied = false;

    //Iterate through each variable in the clause
    for (var j = 0; j < clause.length; j++) {
      //This is a variable in the clause like 1 or -2
      var variable = clause[j];
      var variableSatisfied = false;

      //If the variable is positive and the solution is true
      //Like if the variable is 1 and the solution[0] is true
      if (variable > 0 && solution[variable - 1]) {
        variableSatisfied = true;
      }
      //If the variable is negative and the solution is false
      //Like if the variable is -2 and the solution[1] is false
      else if (variable < 0 && !solution[variable.abs() - 1]) {
        variableSatisfied = true;
      }
      //If the variable is satisfied then the clause is satisfied
      if (variableSatisfied) {
        clauseSatisfied = true;
        break;
      }
    }
    //If the clause is not satisfied then add it to the list
    if (!clauseSatisfied) {
      unsatisfiedClauses.add(i);
    }
  }
  return unsatisfiedClauses;
}
