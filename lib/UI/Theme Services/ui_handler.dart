import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefs = FutureProvider<SharedPreferences>((ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences;
});

enum StateProviderType { oneUi, material }

final selectedStateProviderType = StateProvider<StateProviderType>((ref) {
  final sharedPreferencesAsyncValue = ref.watch(prefs);
  return sharedPreferencesAsyncValue.when(
    data: (sharedPreferences) {
      String? selectedType = sharedPreferences.getString('UITHEME');
      if (selectedType == 'oneUi') {
        log(selectedType!);
        return StateProviderType.oneUi;
      } else {
        log(selectedType ?? 'Null');
        return StateProviderType.material;
      }
    },
    loading: () => StateProviderType.oneUi,
    error: (error, stackTrace) => StateProviderType.oneUi,
  );
});

//Create the Ui selector. Is a widget. take 2 widgets. One for each UI. Check for the current UI and return the correct one.

Widget uiSelector(Widget oneUi, Widget material) => Consumer(
      builder: (_, WidgetRef ref, __) =>
          ref.watch(selectedStateProviderType) == StateProviderType.oneUi
              ? oneUi
              : material,
    );
