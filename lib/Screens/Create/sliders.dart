//Create a basic Sliderimport 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../Services/constants.dart';
import 'home_fields.dart';

class BasicSlider extends StatefulWidget {
  const BasicSlider({super.key});

  @override
  State<BasicSlider> createState() => _BasicSliderState();
}

class _BasicSliderState extends State<BasicSlider> {
  @override
  Widget build(BuildContext context) => Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize - 1),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.fromLTRB(7, 0, 7, 6),
        child: Row(
          children: [
            Center(
              child: Icon(
                Icons.local_parking_outlined,
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
                    '     Να τα αλλάξω όλα σε Sliders;;',
                    style: hintStyle(),
                  ),
                  const SliderExample(),
                ],
              ),
            ),
          ],
        ),
      );
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) => Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      );
}
