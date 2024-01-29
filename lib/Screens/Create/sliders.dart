import 'package:flutter/material.dart';

import '../../Services/constants.dart';
import 'home_fields.dart';

group(BuildContext context, double height, List<Widget> list) => Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize - 1),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
      margin: const EdgeInsets.fromLTRB(7, 0, 7, 9),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //Using generate show every list item and split theme with a divider
          children: list),
    );

class SliderExample extends StatefulWidget {
  const SliderExample({
    required this.currentValue,
    required this.function,
    required this.max,
    required this.min,
    required this.hint,
    required this.iconData,
    super.key,
  });

  final double currentValue;
  final Function function;
  final double max;
  final double min;
  final String hint;
  final IconData iconData;

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
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
            const SizedBox(width: 7),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '     ${widget.hint}',
                    style: hintStyle(),
                  ),
                  Slider(
                    value: widget.currentValue,
                    max: widget.max,
                    min: widget.min,
                    divisions: (widget.max - widget.min).round(),
                    label: widget.currentValue.round().toString(),
                    onChanged: (double value) {
                      widget.function(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
