import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../global_variables.dart';

//Enum with values success and time
enum LineType { success, time }

LineTouchData lineTouchData(BuildContext context, LineType type) =>
    LineTouchData(
      getTouchedSpotIndicator: (
        LineChartBarData barData,
        List<int> spotIndexes,
      ) =>
          spotIndexes
              .map(
                (spotIndex) => TouchedSpotIndicatorData(
                  const FlLine(
                    color: Color.fromRGBO(148, 99, 60, 1),
                    strokeWidth: 3,
                  ),
                  FlDotData(
                    getDotPainter: (spot, percent, barData, index) =>
                        FlDotCirclePainter(
                      radius: 6,
                      color: Colors.white,
                      strokeWidth: 3,
                      strokeColor: const Color.fromRGBO(112, 72, 40, 1),
                    ),
                  ),
                ),
              )
              .toList(),
      touchTooltipData: lineTooltip(context, type),
    );

LineTouchTooltipData lineTooltip(BuildContext context, LineType type) =>
    LineTouchTooltipData(
      tooltipBgColor: Colors.grey,
      getTooltipItems: (List<LineBarSpot> touchedBarSpots) =>
          touchedBarSpots.map((barSpot) {
        final flSpot = barSpot;
        return (type == LineType.success)
            ? lineTooltipItemSuccess(flSpot)
            : lineTooltipItemTime(flSpot);
      }).toList(),
    );

LineTooltipItem lineTooltipItemSuccess(LineBarSpot flSpot) => LineTooltipItem(
      '${flSpot.x.toString()}  M=${(N * flSpot.x).toInt()}',
      const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Play'),
    );

LineTooltipItem lineTooltipItemTime(LineBarSpot flSpot) => LineTooltipItem(
      '${flSpot.y.toStringAsFixed(1)} sec  M=${(N * flSpot.x).toInt()}',
      const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Play'),
    );

FlTitlesData titleData(LineType type) =>
    (type == LineType.success) ? titleDataSuccess() : titleDataTime();

FlTitlesData titleDataSuccess() => FlTitlesData(
      show: true,
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 30,
          interval: (numberOfTests > 10) ? 2 : 1,
          showTitles: true,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 30,
          interval: (numberOfTests > 10) ? 2 : 1,
          showTitles: true,
        ),
      ),
    );

FlTitlesData titleDataTime() => const FlTitlesData(
      show: true,
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 30,
          showTitles: true,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 30,
          showTitles: true,
        ),
      ),
    );

List<LineChartBarData> singleBarDataSuccess(List<FlSpot> spots) {
  List<Color> gradientColors = [
    const Color.fromRGBO(199, 109, 35, 1),
    const Color.fromRGBO(167, 123, 3, 1),
  ];
  return [
    LineChartBarData(
      barWidth: 3,
      isCurved: false,
      spots: spots,
      gradient: LinearGradient(colors: gradientColors),
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ),
  ];
}
