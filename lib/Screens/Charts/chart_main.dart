// ignore_for_file: avoid_print

import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_manager/window_manager.dart';
import '../../constants.dart';
import 'chart_state.dart';

class Chart extends ConsumerStatefulWidget {
  const Chart({super.key});

  @override
  ConsumerState<Chart> createState() => _ChartState();
}

class _ChartState extends ConsumerState<Chart> {
  bool show1 = true;
  bool show2 = true;
  List<Color> gradientColors = [
    const Color.fromRGBO(199, 109, 35, 1),
    const Color.fromRGBO(167, 123, 3, 1),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      chartReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            show1 ? row1() : const SizedBox(),
            show1 ? Expanded(child: lineChart(true)) : const SizedBox(),
            (show1 && show2) ? const SizedBox(height: 20) : const SizedBox(),
            show2 ? row2() : const SizedBox(),
            show2 ? Expanded(child: lineChart(false)) : const SizedBox(),
          ],
        ),
      );

  row1() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Attainability to M/N',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: show2
                  ? const Icon(Icons.fullscreen)
                  : const Icon(Icons.fullscreen_exit),
              onPressed: () async {
                fullScreen(false);
              },
            ),
          ],
        ),
      );

  row2() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Execution Time to M/N',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: show1
                  ? const Icon(Icons.fullscreen)
                  : const Icon(Icons.fullscreen_exit),
              onPressed: () async {
                fullScreen(false);
              },
            ),
          ],
        ),
      );

  bool isFullScreen = false;
  fullScreen(bool isFirst) async {
    if (UniversalPlatform.isWindows) {
      if (await windowManager.isFullScreen()) {
        setState(() {
          isFirst ? show1 = true : show2 = true;
        });
        windowManager.setFullScreen(false);
      } else {
        setState(() {
          isFirst ? show1 = false : show2 = false;
        });
        windowManager.setFullScreen(true);
      }
    } else if (UniversalPlatform.isWeb) {
      if (isFullScreen) {
        setState(() {
          isFirst ? show1 = true : show2 = true;
        });
        FullScreenWindow.setFullScreen(false);
        isFullScreen = false;
      } else {
        setState(() {
          isFirst ? show1 = false : show2 = false;
        });
        FullScreenWindow.setFullScreen(true);
        isFullScreen = true;
      }
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
          lineBarsData: [
            LineChartBarData(
              barWidth: 3,
              isCurved: false,
              spots: isFirst ? spots1 : spots2,
              gradient: LinearGradient(
                colors: gradientColors,
              ),
              isStrokeCapRound: true,
              dotData: const FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
}
