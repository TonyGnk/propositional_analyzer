import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../Create/Create Single/create_single_helper.dart';
import 'chart_single_line_extra.dart';

class ChartTime extends ConsumerStatefulWidget {
  const ChartTime(this.spots, {super.key});

  final List<FlSpot> spots;

  @override
  ConsumerState<ChartTime> createState() => ChartTimeState();
}

class ChartTimeState extends ConsumerState<ChartTime> {
  Duration stepDuration = const Duration(milliseconds: 30);
  List<FlSpot> animatedSpot = [];
  int step = 1;
  double maxY = 0;
  bool isCollapsed = false;

  @override
  initState() {
    super.initState();
    playAgainAnimation();
    maxY = findMaxY(widget.spots);
    print('widget.spots: ${widget.spots}');
  }

  playAgainAnimation() {
    step = findRightStep();
    print('Length spots: ${widget.spots.length}');
    animatedSpot = [];
    Timer.periodic(stepDuration, (timer) {
      setState(() {
        if (animatedSpot.length < widget.spots.length) {
          for (var i = 0; i < step; i++) {
            if (animatedSpot.length < widget.spots.length) {
              animatedSpot.add(widget.spots[animatedSpot.length]);
            } else {
              break;
            }
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  collapseLine() {
    if (isCollapsed) {
      setState(() {
        isCollapsed = false;
      });
    } else {
      setState(() {
        isCollapsed = true;
      });
    }
  }

  int findRightStep() {
    stepDuration = const Duration(milliseconds: 30);
    if (widget.spots.length < 25) {
      stepDuration = const Duration(milliseconds: 200);
      return 1;
    } else {
      return (widget.spots.length / 25).round();
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          chartHeaderSingle(
            'Run Time to M/N',
            playAgainAnimation,
            collapseLine,
            isCollapsed,
          ),
          Expanded(child: chart()),
        ],
      );

  chart() => (animatedSpot.isNotEmpty)
      ? LineChart(
          duration: const Duration(milliseconds: 100),
          LineChartData(
            lineTouchData: lineTouchData(context, LineType.time),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color.fromARGB(255, 54, 54, 54),
              ),
            ),
            titlesData: titleData(LineType.time),
            gridData: const FlGridData(drawHorizontalLine: false),
            minX: widget.spots[0].x.toDouble(),
            maxX: widget.spots[widget.spots.length - 1].x.toDouble(),
            minY: 0,
            maxY: isCollapsed ? maxY : ((timeOut + 1) * 1000).toDouble(),
            lineBarsData: singleBarDataSuccess(animatedSpot),
          ),
        )
      : const SizedBox();
}
