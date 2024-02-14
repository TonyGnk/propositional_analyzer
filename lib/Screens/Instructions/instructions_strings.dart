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
      Text('Παράδειγμα', style: Theme.of(context).textTheme.bodyLarge),
      defaultTextCard(
          'C1 = P1 ∨ P3 ∨ ¬P4\nC2 = P2 ∨ P4 ∨ P5\nC3 = ¬P1 ∨ P2 ∨ ¬P5\nC4 = P1 ∨ ¬P2 ∨ P4'),
      const Text(
        'Το πλήθος των όρων των διαζεύξεων είναι Κ=3, το πλήθος των διαζεύξεων είναι Μ=4 και τα προτασιακά σύμβολα είναι N=5.',
      ),
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
      Text('Example', style: Theme.of(context).textTheme.bodyLarge),
      defaultTextCard(
          'C1 = P1 ∨ P3 ∨ ¬P4\nC2 = P2 ∨ P4 ∨ P5\nC3 = ¬P1 ∨ P2 ∨ ¬P5\nC4 = P1 ∨ ¬P2 ∨ P4'),
      const Text(
        'The number of terms of the disjunctions is K=3, the number of disjunctions is M=4 and the propositional symbols are N=5.',
      ),
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
  1: page1GreekText,
  2: page1EnglishText,
};
