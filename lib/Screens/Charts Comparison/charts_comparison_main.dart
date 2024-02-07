// ignore_for_file: avoid_print

import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import '../../Services/global_variables.dart';
import '../../UI/Routed Screen/app_bar.dart';
import 'chart_comparison_state.dart';
import 'line_data.dart';

class ChartComparison extends ConsumerStatefulWidget {
  const ChartComparison({super.key});

  @override
  ConsumerState<ChartComparison> createState() => _ChartState();
}

bool show1 = true;
bool show2 = true;

class _ChartState extends ConsumerState<ChartComparison> {
  List<Color> gradientColors = [
    const Color.fromRGBO(199, 109, 35, 1),
    const Color.fromRGBO(167, 123, 3, 1),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      chartComparisonReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              show1 ? row(true) : const SizedBox(),
              show1 ? Expanded(child: lineChart(true)) : const SizedBox(),
              (show1 && show2) ? const SizedBox(height: 20) : const SizedBox(),
              show2 ? row(false) : const SizedBox(),
              show2 ? Expanded(child: lineChart(false)) : const SizedBox(),
            ],
          ),
        ),
      );

  row(bool isFirst) => Consumer(
        builder: (context, ref, _) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isFirst ? 'Attainability to M/N' : 'Execution Time to M/N',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: isFullScreen
                    ? const Icon(Icons.fullscreen_exit)
                    : const Icon(Icons.fullscreen),
                onPressed: () async {
                  fullScreen(ref, isFirst);
                },
              )
            ],
          ),
        ),
      );

  findIcon(isFirst, WidgetRef ref) => isFirst
      ? IconButton(
          icon: isFullScreen
              ? const Icon(Icons.fullscreen_exit)
              : const Icon(Icons.fullscreen),
          onPressed: () async {},
        )
      : IconButton(
          icon: isFullScreen
              ? const Icon(Icons.fullscreen_exit)
              : const Icon(Icons.fullscreen),
          onPressed: () async {},
        );

  bool isFullScreen = false;
  fullScreen(WidgetRef ref, bool isFirst) async {
    if (isFullScreen) {
      setState(() {
        isFirst ? show2 = true : show1 = true;
        ref.read(appBarIsEnableProvider.notifier).state = true;
        isFullScreen = false;
      });
      FullScreenWindow.setFullScreen(false);
    } else {
      setState(() {
        isFirst ? show2 = false : show1 = false;
        ref.read(appBarIsEnableProvider.notifier).state = false;
        isFullScreen = true;
      });
      FullScreenWindow.setFullScreen(true);
    }
  }

  lineChart(bool isFirst) => LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            getTouchedSpotIndicator: (
              LineChartBarData barData,
              List<int> spotIndexes,
            ) =>
                spotIndexes
                    .map((spotIndex) => TouchedSpotIndicatorData(
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
                        ))
                    .toList(),
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.grey,
              getTooltipItems: (List<LineBarSpot> touchedBarSpots) =>
                  touchedBarSpots.map((barSpot) {
                final flSpot = barSpot;

                return LineTooltipItem(
                  isFirst
                      ? '${flSpot.x.toString()}  M=${(N * flSpot.x).toInt()}'
                      : '${flSpot.y.toStringAsFixed(1)} sec  M=${(N * flSpot.x).toInt()}',
                  const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Play'),
                );
              }).toList(),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d)),
          ),
          titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: const FlGridData(
            drawHorizontalLine: false,
          ),
          maxY: isFirst ? 1 : null,
          minY: isFirst ? 0 : 0,
          lineBarsData: linesChartBarData(),
        ),
      );
}
