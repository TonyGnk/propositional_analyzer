import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../six_calculations.dart';

rowOfChecks() => Row(
      children: [
        Expanded(
          child: col1(),
        ),
        Expanded(
          child: col2(),
        ),
      ],
    );

col1() => Column(
      children: [
        totalCheckBox(CalculationType.addition),
        totalCheckBox(CalculationType.subtraction),
        totalCheckBox(CalculationType.multiplication),
      ],
    );

col2() => Column(
      children: [
        totalCheckBox(CalculationType.division),
        totalCheckBox(CalculationType.square),
        totalCheckBox(CalculationType.exponential),
      ],
    );

Widget totalCheckBox(CalculationType type) => Consumer(
      builder: (context, ref, _) {
        final checkedPlus = ref.watch(checkPlusOneProvider);
        final checkedMinus = ref.watch(checkMinusOneProvider);
        final checkedDouble = ref.watch(checkDoubleProvider);
        final checkedHalf = ref.watch(checkHalfProvider);
        final checkedSquare = ref.watch(checkSquareProvider);
        final checkedRoot = ref.watch(checkRootProvider);
        return CheckboxListTile(
          subtitle: Text(
            getCalculationName()[type]!,
            style: const TextStyle(
              fontFamily: 'Play',
              fontSize: 15,
            ),
          ),
          value: getCheckValue(
            checkedPlus,
            checkedMinus,
            checkedDouble,
            checkedHalf,
            checkedSquare,
            checkedRoot,
            type,
          ),
          dense: true,
          onChanged: (newValue) {
            enabledOperations[type] = newValue ?? true;
            if (type == CalculationType.addition) {
              ref.read(checkPlusOneProvider.notifier).state = newValue!;
            } else if (type == CalculationType.subtraction) {
              ref.read(checkMinusOneProvider.notifier).state = newValue!;
            } else if (type == CalculationType.multiplication) {
              ref.read(checkDoubleProvider.notifier).state = newValue!;
            } else if (type == CalculationType.division) {
              ref.read(checkHalfProvider.notifier).state = newValue!;
            } else if (type == CalculationType.square) {
              ref.read(checkSquareProvider.notifier).state = newValue!;
            } else if (type == CalculationType.exponential) {
              ref.read(checkRootProvider.notifier).state = newValue!;
            }
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );

getCheckValue(
  bool checkedPlus,
  bool checkedMinus,
  bool checkedDouble,
  bool checkedHalf,
  bool checkedSquare,
  bool checkedRoot,
  CalculationType type,
) {
  if (type == CalculationType.addition) {
    return checkedPlus;
  } else if (type == CalculationType.subtraction) {
    return checkedMinus;
  } else if (type == CalculationType.multiplication) {
    return checkedDouble;
  } else if (type == CalculationType.division) {
    return checkedHalf;
  } else if (type == CalculationType.square) {
    return checkedSquare;
  } else if (type == CalculationType.exponential) {
    return checkedRoot;
  }
}

//Provider checkedValue
final checkPlusOneProvider = StateProvider<bool>((ref) => true);
final checkMinusOneProvider = StateProvider<bool>((ref) => true);
final checkDoubleProvider = StateProvider<bool>((ref) => true);
final checkHalfProvider = StateProvider<bool>((ref) => true);
final checkSquareProvider = StateProvider<bool>((ref) => true);
final checkRootProvider = StateProvider<bool>((ref) => true);

Map<CalculationType, bool> enabledOperations = {
  CalculationType.addition: true,
  CalculationType.subtraction: true,
  CalculationType.multiplication: true,
  CalculationType.division: true,
  CalculationType.exponential: true,
  CalculationType.square: true,
};
