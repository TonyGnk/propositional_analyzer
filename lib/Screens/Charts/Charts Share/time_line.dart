import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../UI/Routed Screen/app_bar.dart';
import '../../../global_variables.dart';
import '../../Create/Create Single/create_single_helper.dart';
import '../Charts Single/chart_single_line_extra.dart';

class ChartTime extends ConsumerStatefulWidget {
  const ChartTime(this.spots, {super.key});

  final List<FlSpot> spots;

  @override
  ConsumerState<ChartTime> createState() => ChartTimeState();
}

class ChartTimeState extends ConsumerState<ChartTime> {
  Duration stepDuration = const Duration(milliseconds: 20);
  List<FlSpot> animatedSpot = [];
  int step = 1;
  double maxY = 0;
  bool isCollapsed = true;
  bool isFullScreen = false;

  @override
  initState() {
    super.initState();
    playAgainAnimation();
    maxY = findMaxY(widget.spots);
  }

  playAgainAnimation() {
    step = findRightStep();
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

  fullScreen() {
    setState(() {
      if (isFullScreen) {
        ref.read(appBarIsEnableProvider.notifier).state = true;
        ref.read(hideSuccessProvider.notifier).state = false;
        isFullScreen = false;
      } else {
        ref.read(appBarIsEnableProvider.notifier).state = false;
        ref.read(hideSuccessProvider.notifier).state = true;
        isFullScreen = true;
      }
    });
  }

  int findRightStep() {
    stepDuration = const Duration(milliseconds: 20);
    if (widget.spots.length > 40) {
      return (widget.spots.length / 25).round();
    } else if (widget.spots.length > 25) {
      stepDuration = const Duration(milliseconds: 35);
      return 1;
    } else {
      stepDuration = const Duration(milliseconds: 50);
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hideWidget = ref.watch(hideTimeProvider);
    return !hideWidget
        ? Expanded(
            child: Column(
              children: [
                chartHeaderSingle(
                  'Run Time to M/N',
                  playAgainAnimation,
                  collapseLine,
                  fullScreen,
                  isCollapsed,
                  isFullScreen,
                ),
                Expanded(child: chart()),
              ],
            ),
          )
        : const SizedBox();
  }

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
