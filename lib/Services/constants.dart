import 'package:flutter/material.dart';

const double cornerSize = 16;

enum AlgorithmType { breadth, depth, best, astar }

const Duration basicDuration = Duration(milliseconds: 200);
Duration basicDuration1 = Duration(
  milliseconds: basicDuration.inMilliseconds + 100,
);
Duration basicDuration2 = Duration(
  milliseconds: basicDuration.inMilliseconds + 200,
);
Duration basicDuration3 = Duration(
  milliseconds: basicDuration.inMilliseconds + 300,
);
Duration basicDuration4 = Duration(
  milliseconds: basicDuration.inMilliseconds + 400,
);
Duration basicDuration5 = Duration(
  milliseconds: basicDuration.inMilliseconds + 500,
);

centerAppBarText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 27,
        fontFamily: 'Play',
      ),
    );
