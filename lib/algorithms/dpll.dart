// ignore_for_file: avoid_print
// DPLL algorithm
//
///The boolean satisfiability problem is a problem of finding an assignment of truth values to a set of propositional symbols that satisfies a given set of clauses. A clause is a disjunction of literals, where a literal is either a propositional symbol or its negation.
import 'dart:core';

class DPLL {
  bool DPLL_Satisfiable(Set<Set<int>> clauses, Map<String, bool> model) {
    if (clauses.isEmpty) {
      return true;
    }
    if (clauses.any((clause) => clause.isEmpty)) {
      return false;
    }

    String p = selectUnassignedVariable(clauses, model);

    Map<String, bool> modelTrue = Map.from(model);
    modelTrue[p] = true;

    Set<Set<int>>? reducedTrue = reduce(clauses, p, true);
    if (reducedTrue != null && DPLL_Satisfiable(reducedTrue, modelTrue)) {
      model.addAll(modelTrue);
      return true;
    }

    Map<String, bool> modelFalse = Map.from(model);
    modelFalse[p] = false;

    Set<Set<int>>? reducedFalse = reduce(clauses, p, false);
    if (reducedFalse != null && DPLL_Satisfiable(reducedFalse, modelFalse)) {
      model.addAll(modelFalse);
      return true;
    }

    return false;
  }

  String selectUnassignedVariable(
    Set<Set<int>> clauses,
    Map<String, bool> model,
  ) {
    for (Set<int> clause in clauses) {
      for (int literal in clause) {
        String variable = literal.abs().toString();
        if (!model.containsKey(variable)) {
          return variable;
        }
      }
    }
    return '';
  }

  Set<Set<int>>? reduce(
    Set<Set<int>> clauses,
    String p,
    bool value,
  ) {
    Set<Set<int>> reducedClauses = {};
    int variable = int.parse(p);
    for (Set<int> clause in clauses) {
      if (value && clause.contains(-variable)) {
        continue; // Skip this clause because it's satisfied
      } else if (!value && clause.contains(variable)) {
        continue; // Skip this clause because it's satisfied
      } else {
        // Remove falsified literals and add the clause to the reduced set
        Set<int> reducedClause = clause
            .where((literal) => literal != (value ? variable : -variable))
            .toSet();
        if (reducedClause.isEmpty) {
          return null; // Return null if a clause becomes empty
        }
        reducedClauses.add(reducedClause);
      }
    }
    return reducedClauses;
  }
}
