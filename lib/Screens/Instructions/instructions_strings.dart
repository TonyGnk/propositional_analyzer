import 'package:flutter/material.dart';

List<Widget> page1GreekText(BuildContext context) => [
      Icon(
        Icons.flag_outlined,
        color: Theme.of(context).colorScheme.primary,
        size: 52,
      ),
      Text(
        'Ικανοποιησιμότητα προτάσεων',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.2),
      ),
      const Text(
          'Έστω ένα σύνολο N προτασιακών συμβόλων P1, P2, ..., PΝ, κάθε μια από τις οποίες μπορεί να είτε αληθής είτε ψευδής.'),
      defaultTextCard('Αληθής, Ψευδής, Ψευδής'),
      const Text(
        'Έχουμε ένα σύνολο διαζεύξεων C1, C2..., CM, της μορφής:',
      ),
      defaultTextCard('C1:  L1  ή  L2  ή  L4\nC2:  L2  ή  L3  ή  L4'),
      const Text(
          'Όπου K το πλήθος των όρων των διαζεύξεων (3). Κάθε όρος L μπορεί να είναι θετικός ή αρνητικός (¬)'),
      defaultTextCard('L1 = P1  ή L2 = ¬P2\nΑν P2 = Αληθής τότε L2 = Ψευδής'),
      Text(
        'Παράδειγμα',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
      ),
      defaultTextCard(
          'C1 = P1 ∨ P3 ∨ ¬P4\nC2 = P2 ∨ P4 ∨ P5\nC3 = ¬P1 ∨ P2 ∨ ¬P5\nC4 = P1 ∨ ¬P2 ∨ P4'),
      const Text(
        'Το πλήθος των όρων των διαζεύξεων είναι Κ=3, το πλήθος των διαζεύξεων είναι Μ=4 και τα προτασιακά σύμβολα είναι N=5.',
      ),
    ];

List<Widget> page2GreekText(BuildContext context) => [
      Icon(
        Icons.sync_problem_outlined,
        color: Theme.of(context).colorScheme.primary,
        size: 52,
      ),
      Text(
        'Πρόβλημα',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.2),
      ),
      const Text(
          'Το πρόβλημα της ικανοποιησιμότητας συνίσταται στην εύρεση μιας ανάθεσης τιμών στα προτασιακά σύμβολα P, έτσι ώστε να αληθεύουν όλες οι διαζεύξεις C. '),
      defaultTextCard(
          'C1 = P1 ∨ P3 ∨ ¬P4\nC2 = P2 ∨ P4 ∨ P5\nC3 = ¬P1 ∨ P2 ∨ ¬P5\nC4 = P1 ∨ ¬P2 ∨ P4'),
      const Text('Στο παράδειγμα, μια τέτοια ανάθεση τιμών είναι:'),
      defaultTextCard('P1=Αληθής, P2=Αληθής, P3=Αληθης, P4=Ψευδής, P5=Αληθής'),
      const Text('Έτσι όλες οι προτάσεις ικανοποιούνται:'),
      defaultTextCard(
          'C1 = Αληθής ∨ Αληθής ∨ Ψευδής\nC2 = Αληθής ∨ Ψευδής ∨ Αληθής\nC3 = Ψευδής ∨ Αληθής ∨ ψευδής\nC4 = Αληθής ∨ Ψευδής ∨ Αληθής'),
      const Text(
          'Κάποιες φορές το πρόβλημα μπορεί να έχει παραπάνω από μια λύσεις ή και καμία λύση. Τότε το πρόβλημα θα είναι αδύνατο.'),
      const Text(
          'Για την επίλυση προβλημάτων αυτού του είδους, αξιοποιούνται αλγόριθμοι βασισμένοι στην αναζήτηση, όπως:'),
      defaultTextCard(
          '-Αλγόριθμος αναρρίχησης λόφων\n-Αναζήτηση πρώτα σε βάθος\n-Αλγόριθμος DPLL\n-Αλγόριθμος WalkSAT'),
    ];

List<Widget> page3GreekText(BuildContext context) => [
      Icon(
        Icons.query_stats_outlined,
        color: Theme.of(context).colorScheme.primary,
        size: 52,
      ),
      Text(
        'Σκοπός Εφαρμογής',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.2),
      ),
      const Text(
          'Σκοπός της εφαρμογής είναι η ανάλυση τις συμπεριφοράς των αλγορίθμων και η εύρεση του λόγου Μ/Ν (Αριθμός ικανοποιήσιμων διαζεύξεων/Αριθμό προτασιακών συμβόλων).'),
      Text(
        'Περίγραμμα Εφαρμογής',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
      ),
      defaultTextCard(
          ' M = 0\n Επανάλαβε {\n   Πρόβλημα = ΝέοΠρόβλημα(M)\n   Λύση = Επίλυση(Πρόβλημα)\n   Μ = Μ+1\n} Όσο (ΣυνθήκηΔιακοπής)'),
      const Text(
          'Όπου ΣυνθήκηΔιακοπής είναι "Επανέλαβε μέχρι να αποτύχεις να βρεις λύση Ζ φορές συνεχόμενα".'),
      Text(
        'Επεξήγηση Πεδίων',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
      ),
      defaultTextCard(
          'Μεταβλητή K: Πλήθος διαζεύξεων\n\nΜεταβλητή N: Πλήθος προτασιακών συμβόλων\n\nΜεταβλητή Tests: Πλήθος Προβλημάτων που θα δημιουργούνται και θα επιλύονται με το ίδιο Μ\n\nΜεταβλητή Διακοπής: Στις πόσες συνεχόμενες ήττες να σταματήσει η εκτέλεση\n\nTimeOut: Χρονικό Όριο Εύρεσης Λύσης για κάθε αλγόριθμο και για κάθε δοκιμή'),
      const Text(
          'Στην περίπτωση που οριστεί αριθμός δοκιμών (Tests) μεγαλύτερος από 1, έστω 3, και οριστεί μεταβλητή διακοπής με 2 για να σταματήσει ο εκτέλεση θα πρέπει να συμβούν 6 αποτυχίες συνεχόμενα.'),
    ];

List<Widget> page1EnglishText(BuildContext context) => [
      Icon(
        Icons.flag_outlined,
        color: Theme.of(context).colorScheme.primary,
        size: 52,
      ),
      Text(
        'Satisfiability of propositions',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.2),
      ),
      const Text(
          'Let there be a set N of propositional symbols P1, P2, ..., PN, each of which can be either true or false.'),
      defaultTextCard('True, False, False'),
      const Text(
        'We have a set of disjunctions C1, C2..., CM, of the form:',
      ),
      defaultTextCard('C1:  L1  or  L2  or  L4\nC2:  L2  or  L3  or  L4'),
      const Text(
          'Where K is the number of terms of the disjunctions (3). Each term L can be positive or negative'),
      defaultTextCard('L1 = P1  or L2 = Not P2\nIf P2 = True then L2 = False'),
      Text(
        'Example',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
      ),
      defaultTextCard(
          'C1 = P1 ∨ P3 ∨ ¬P4\nC2 = P2 ∨ P4 ∨ P5\nC3 = ¬P1 ∨ P2 ∨ ¬P5\nC4 = P1 ∨ ¬P2 ∨ P4'),
      const Text(
        'The number of terms of the disjunctions is K=3, the number of disjunctions is M=4 and the propositional symbols are N=5.',
      ),
    ];

List<Widget> page2EnglishText(BuildContext context) => [
      Icon(
        Icons.sync_problem_outlined,
        color: Theme.of(context).colorScheme.primary,
        size: 52,
      ),
      Text(
        'Problem',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.2),
      ),
      const Text(
          'The satisfiability problem consists in finding an assignment of values to the propositional symbols P, so that all disjunctions C are true.'),
      defaultTextCard(
          'C1 = P1 ∨ P3 ∨ ¬P4\nC2 = P2 ∨ P4 ∨ P5\nC3 = ¬P1 ∨ P2 ∨ ¬P5\nC4 = P1 ∨ ¬P2 ∨ P4'),
      const Text('In the example, such an assignment of values is:'),
      defaultTextCard('P1=True, P2=True, P3=True, P4=False, P5=True'),
      const Text('Thus all propositions are satisfied:'),
      defaultTextCard(
          'C1 = True ∨ True ∨ False\nC2 = True ∨ False ∨ True\nC3 = False ∨ True ∨ False\nC4 = True ∨ False ∨ True'),
      const Text(
          'Sometimes the problem may have more than one solutions or no solution. Then the problem will be impossible.'),
      const Text(
          'For solving problems of this kind, search-based algorithms are utilized, such as:'),
      defaultTextCard(
          '-Hill climbing algorithm\n-Depth-first search\n-DPLL algorithm\n-WalkSAT algorithm'),
    ];

    List<Widget> page3EnglishText(BuildContext context) => [
      Icon(
        Icons.query_stats_outlined,
        color: Theme.of(context).colorScheme.primary,
        size: 52,
      ),
      Text(
        'Application Purpose',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.2),
      ),
      const Text(
          'The purpose of the application is to analyze the behavior of the algorithms and find the M/N ratio (Number of satisfiable disjunctions/Number of propositional symbols).'),
      Text(
        'Application Outline',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
      ),
      defaultTextCard(
          ' M = 0\n Repeat {\n   Problem = NewProblem(M)\n   Solution = Solve(Problem)\n   M = M+1\n} While (BreakCondition)'),
      const Text(
          'Where BreakCondition is "Repeat until you fail to find a solution Z times in a row".'),
      Text(
        'Field Explanation',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
      ),
      defaultTextCard(
          'Variable K: Number of disjunctions\n\nVariable N: Number of propositional symbols\n\nVariable Tests: Number of Problems that will be created and solved with the same M\n\nBreak Variable: After how many consecutive failures to stop execution\n\nTimeOut: Time Limit for Finding Solution for each algorithm and for each test'),
      const Text(
          'In the case where a number of tests (Tests) greater than 1 is set, say 3, and a break variable is set with 2 to stop execution, 6 consecutive failures must occur.'),
    ];

defaultTextCard(String text) => Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Text(text),
              ),
            ),
          ),
        ],
      ),
    );

Map<int, List<Widget> Function(BuildContext context)> instructionsText = {
  1: page3GreekText,
  // 2: page2GreekText,
  2: page2EnglishText,
};
