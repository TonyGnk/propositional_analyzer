import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../Theme Services/ui_change.dart';

class AdaptSegmentedButtons extends StatefulWidget {
  const AdaptSegmentedButtons({
    required this.onPressed,
    required this.labels,
    required this.value,
    super.key,
  });

  /// The callback that is called when the button is pressed.
  final List<VoidCallback> onPressed;

  /// The logical value for selecting the ui. If true, then selectedOne is 0 otherwise 1. Only for the material implementation.
  final int value;

  /// The text that is displayed on the button.
  final List<String> labels;

  @override
  State<AdaptSegmentedButtons> createState() => _AdaptSegmentedButtonsState();
}

class _AdaptSegmentedButtonsState extends State<AdaptSegmentedButtons> {
  int? uiValue;
  int selectedOne = 3;
//Initializer
  @override
  void initState() {
    super.initState();
    unawaited(setUiTheme());
  }

  Future<void> setUiTheme() async {
    final value = await getUiTheme();
    log('!!!!!!!!!!!!!!!!!!!!!!!!UI value: $value');
    setState(() {
      uiValue = value;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Row(
        children: [
          //Create a list of buttons
          for (var i = 0; i < widget.labels.length; i++)
            Expanded(
              child: AnimatedContainer(
                //width: 53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: selectedOne == 3
                      ? uiValue == null
                          ? Colors.transparent
                          : uiValue == i
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent
                      : selectedOne == i
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                ),
                clipBehavior: Clip.antiAlias,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                margin: const EdgeInsets.all(5),
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      //SetState set selectedOne to i
                      themeSwitcher(i);
                      setState(() {
                        selectedOne = i;
                      });
                    },
                    child: Center(
                      child: Text(
                        widget.labels[i],
                        style: TextStyle(
                          color: selectedOne == 3
                              ? uiValue == null
                                  ? Theme.of(context).colorScheme.onBackground
                                  : uiValue == i
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground
                              : selectedOne == i
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ));

  //Create a runner function. Get int if 0 then toggleUI(context, 'material'), else toggleUI(context, 'oneUi') is async
  Future<void> themeSwitcher(int ui) async {
    //wait 200ms

    (ui == 0)
        ? await toggleUI(context, 'material')
        : await toggleUI(context, 'oneUi');
  }
}
