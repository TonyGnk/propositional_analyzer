import 'package:flutter/material.dart';

import '../../../global_variables.dart';
import 'slide_item.dart';

slideK(Function(int value) function) => SliderItem(
      currentValue: K.toDouble(),
      min: 1,
      max: 12,
      hint: 'Variable K=$K',
      iconData: Icons.expand_less_outlined,
      function: function,
    );

slideN(Function(int value) updateN) => SliderItem(
      currentValue: N.toDouble(),
      min: 1,
      max: 12,
      hint: 'Variable N=$N',
      iconData: Icons.local_parking_outlined,
      function: updateN,
    );

slideTests(Function(int value) updateTests) => SliderItem(
      currentValue: numberOfTests.toDouble(),
      min: 1,
      max: 15,
      hint: 'Make $numberOfTests',
      extraHint: (numberOfTests == 1) ? 'test' : 'tests',
      iconData: Icons.workspaces_outlined,
      function: updateTests,
    );

slideStop(Function(int value) updateStop) => SliderItem(
      currentValue: stop.toDouble(),
      min: 1,
      max: 10,
      hint: 'Stop after $stop',
      extraHint: (stop == 1) ? 'failure' : 'failures',
      iconData: Icons.remove_done_outlined,
      function: updateStop,
    );

slideTime(Function(int value) updateTime) => SliderItem(
      currentValue: timeOut.toDouble(),
      min: 1,
      max: 29,
      hint: 'Stop test after ${timeText[timeOut.toInt()]!}',
      iconData: Icons.timer,
      isTime: true,
      function: updateTime,
    );
