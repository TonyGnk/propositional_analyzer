import 'package:flutter/material.dart';

import '../../../global_variables.dart';

group(BuildContext context, double height, List<Widget> list) => Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize - 1),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 4),
      margin: const EdgeInsets.fromLTRB(7, 0, 7, 8),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: list),
    );

class SliderItem extends StatefulWidget {
  const SliderItem({
    required this.currentValue,
    required this.function,
    required this.max,
    required this.min,
    required this.hint,
    required this.iconData,
    this.extraHint = '',
    this.isTime = false,
    super.key,
  });

  final double currentValue;
  final Function function;
  final double max;
  final double min;
  final String hint;
  final String extraHint;
  final IconData iconData;
  final bool isTime;

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Center(
              child: Icon(
                widget.iconData,
                color: Theme.of(context).canvasColor,
              ),
            ),
            const SizedBox(width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '     ${widget.hint} ${widget.extraHint}',
                    style: TextStyle(
                      fontFamily: 'Play',
                      fontSize: 16,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.9),
                      height: 0.4,
                    ),
                  ),
                  widget.isTime
                      ? sliderForTime()
                      : Slider(
                          thumbColor:
                              Theme.of(context).canvasColor.withOpacity(1),
                          activeColor:
                              Theme.of(context).canvasColor.withOpacity(0.6),
                          inactiveColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.2),
                          value: widget.currentValue,
                          max: widget.max,
                          min: widget.min,
                          divisions: (widget.max - widget.min).round(),
                          onChanged: (double value) {
                            widget.function(value.toInt());
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      );

  sliderForTime() => Slider(
        thumbColor: Theme.of(context).canvasColor.withOpacity(1),
        activeColor: Theme.of(context).canvasColor.withOpacity(0.6),
        inactiveColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        value: timeMap[widget.currentValue.toInt()]!.toDouble(),
        max: widget.max,
        min: widget.min,
        divisions: (widget.max - widget.min).round(),
        onChanged: (double value) {
          widget.function(getKeyFromValue(value.toInt()));
        },
      );

  //Create a Map with the first part int and the second int
  Map<int, int> timeMap = {
    2: 1,
    3: 2,
    4: 3,
    5: 4,
    6: 5,
    7: 6,
    8: 7,
    9: 8,
    10: 9,
    11: 10,
    12: 11,
    13: 12,
    14: 13,
    15: 14,
    20: 15,
    25: 16,
    30: 17,
    45: 18,
    60: 19,
    90: 20,
    120: 21,
    150: 22,
    180: 23,
    210: 24,
    240: 25,
    270: 26,
    300: 27,
    600: 28,
    900: 29,
  };

  getKeyFromValue(int value) =>
      timeMap.keys.firstWhere((k) => timeMap[k] == value);
}

Map<int, String> timeText = {
  2: '2 sec',
  3: '3 sec',
  4: '4 sec',
  5: '5 sec',
  6: '6 sec',
  7: '7 sec',
  8: '8 sec',
  9: '9 sec',
  10: '10 sec',
  11: '11 sec',
  12: '12 sec',
  13: '13 sec',
  14: '14 sec',
  15: '15 sec',
  20: '20 sec',
  25: '25 sec',
  30: '30 sec',
  45: '45 sec',
  60: '1 min',
  90: '1.5 min',
  120: '2 min',
  150: '2.5 min',
  180: '3 min',
  210: '3.5 min',
  240: '4 min',
  270: '4.5 min',
  300: '5 min',
  600: '10 min',
  900: '15 min',
};
