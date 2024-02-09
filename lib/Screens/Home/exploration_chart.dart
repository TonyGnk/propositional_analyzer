import 'dart:async';
import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../global_variables.dart';

class LineChartSample10 extends StatefulWidget {
  const LineChartSample10({super.key});

  final Color sinColor = Colors.blue;
  final Color cosColor = Colors.pink;

  @override
  State<LineChartSample10> createState() => _LineChartSample10State();
}

class _LineChartSample10State extends State<LineChartSample10> {
  final limitCount = 950;
  // final sinPoints = <FlSpot>[];
  // final cosPoints = <FlSpot>[];

  double xValue = 0;
  double step = 0.05;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(const Duration(milliseconds: 11), (timer) {
    //   while (sinPoints.length > limitCount) {
    //     sinPoints.removeAt(0);
    //     cosPoints.removeAt(0);
    //   }
    //   setState(() {
    //     sinPoints.add(FlSpot(xValue, math.sin(xValue)));
    //     cosPoints.add(FlSpot(xValue, math.cos(xValue)));
    //   });
    //   xValue += step;
    // });
  }

  @override
  Widget build(BuildContext context) => spots1Hill.isNotEmpty
      ? Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              Text(
                'x: ${xValue.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Hill: ${spots1Hill.last.y.toStringAsFixed(1)}',
                style: TextStyle(
                  color: widget.sinColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Depth: ${spots1Depth.last.y.toStringAsFixed(1)}',
                style: TextStyle(
                  color: widget.cosColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: LineChart(
                    LineChartData(
                      minY: 0,
                      maxY: 1.01,
                      minX: spots1Hill.first.x,
                      maxX: spots1Hill.last.x,
                      lineTouchData: const LineTouchData(enabled: false),
                      clipData: const FlClipData.all(),
                      gridData: const FlGridData(
                        show: true,
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        sinLine(spots1Hill),
                      ],
                      titlesData: const FlTitlesData(
                        show: false,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      : const SizedBox();

  LineChartBarData sinLine(List<FlSpot> points) => LineChartBarData(
        spots: points,
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: [widget.sinColor.withOpacity(0), widget.sinColor],
          stops: const [0.1, 1.0],
        ),
        barWidth: 4,
      );

  // LineChartBarData cosLine(List<FlSpot> points) => LineChartBarData(
  //       spots: points,
  //       dotData: const FlDotData(show: false),
  //       gradient: LinearGradient(
  //         colors: [widget.cosColor.withOpacity(0), widget.cosColor],
  //         stops: const [0.1, 1.0],
  //       ),
  //       barWidth: 4,
  //     );

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
