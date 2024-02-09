import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartBarData line(
  List<FlSpot> points,
  Color color,
) =>
    LineChartBarData(
      spots: points,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [color.withOpacity(0), color],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
    );
