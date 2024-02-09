import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../Charts/Charts Multi/line_data.dart';

LineChartBarData line(
  List<FlSpot> points,
  Color color,
) =>
    LineChartBarData(
      spots: points,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [orange1.withOpacity(0), orange1],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
    );
