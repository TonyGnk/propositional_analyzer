import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';
import '../Charts Share/multi_time_line.dart';
import '../Charts Share/success_line.dart';
import 'charts_multi_state.dart';
import 'line_data.dart';

class ChartMulti extends ConsumerStatefulWidget {
  const ChartMulti({super.key});

  @override
  ConsumerState<ChartMulti> createState() => _ChartMultiState();
}

bool show1 = true;
bool show2 = true;

class _ChartMultiState extends ConsumerState<ChartMulti> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      chartsMultiReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ChartSuccess(spots1)),
            Expanded(
                child: ChartMultiTime([
              spots2Hill,
              spots2Depth,
              spots2DPLL,
              spots2Walk,
            ])),
          ],
        ),
      );

  // lineChart(bool isFirst) => LineChart(
  //       LineChartData(
  //         lineTouchData: LineTouchData(
  //           getTouchedSpotIndicator: (
  //             LineChartBarData barData,
  //             List<int> spotIndexes,
  //           ) =>
  //               spotIndexes
  //                   .map((spotIndex) => TouchedSpotIndicatorData(
  //                         const FlLine(
  //                           color: Color.fromRGBO(148, 99, 60, 1),
  //                           strokeWidth: 3,
  //                         ),
  //                         FlDotData(
  //                           getDotPainter: (spot, percent, barData, index) =>
  //                               FlDotCirclePainter(
  //                             radius: 6,
  //                             color: Colors.white,
  //                             strokeWidth: 3,
  //                             strokeColor: const Color.fromRGBO(112, 72, 40, 1),
  //                           ),
  //                         ),
  //                       ))
  //                   .toList(),
  //           touchTooltipData: LineTouchTooltipData(
  //             tooltipBgColor: Colors.grey,
  //             getTooltipItems: (List<LineBarSpot> touchedBarSpots) =>
  //                 touchedBarSpots.map((barSpot) {
  //               final flSpot = barSpot;

  //               return LineTooltipItem(
  //                 isFirst
  //                     ? '${flSpot.x.toString()}  M=${(N * flSpot.x).toInt()}'
  //                     : '${flSpot.y.toStringAsFixed(1)} sec  M=${(N * flSpot.x).toInt()}',
  //                 const TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold,
  //                     fontFamily: 'Play'),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //         borderData: FlBorderData(
  //           show: true,
  //           border: Border.all(color: const Color(0xff37434d)),
  //         ),
  //         titlesData: const FlTitlesData(
  //           show: true,
  //           topTitles: AxisTitles(
  //             sideTitles: SideTitles(showTitles: false),
  //           ),
  //         ),
  //         gridData: const FlGridData(
  //           drawHorizontalLine: false,
  //         ),
  //         maxY: isFirst ? 1 : null,
  //         minY: isFirst ? 0 : 0,
  //         lineBarsData: isFirst ? linesChartBarData() : linesChartBarData2(),
  //       ),
  //     );
}
