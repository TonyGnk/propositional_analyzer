import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../Services/global_variables.dart';

// Color #FFD180
Color orange1 = const Color.fromRGBO(255, 209, 128, 1);
// Color #FFAB40
Color orange2 = const Color.fromRGBO(255, 171, 64, 1);
//Color #FF9100
Color orange3 = const Color.fromRGBO(255, 145, 0, 1);
//Color #FF6D00
Color orange4 = const Color.fromRGBO(255, 109, 0, 1);

List<LineChartBarData> linesChartBarData() => [
      lineChartBarData(spotsHill, orange1),
      lineChartBarData(spotsDepth, orange2),
      lineChartBarData(spotsDPLL, orange3),
      lineChartBarData(spotsWalk, orange4),
    ];

lineChartBarData(List<FlSpot> spots, Color gradient) => LineChartBarData(
      barWidth: 3,
      isCurved: false,
      spots: spots,
      color: gradient,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
    );
