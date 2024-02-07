import 'package:flutter/material.dart';

import '../../../Services/global_variables.dart';

class Track extends StatelessWidget {
  const Track({
    required this.M,
    this.avg = 0,
    super.key,
  });
  final int avg;
  final int M;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).shadowColor,
        padding: const EdgeInsets.fromLTRB(50, 9, 9, 9),
        margin: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            const Icon(
              Icons.assignment_outlined,
            ),
            const SizedBox(width: 10),
            Text(
              'Test M$M',
            ),
            const SizedBox(width: 10),
            Text(
              '$avg/$numberOfTests',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Play',
                fontWeight: FontWeight.bold,
                color: (avg >= numberOfTests.toDouble() / 2)
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      );
}

class Search {
  const Search({
    required this.win,
    this.time = 0,
  });
  final bool win;
  final int time;
}
