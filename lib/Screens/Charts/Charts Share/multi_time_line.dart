import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../UI/Routed Screen/app_bar.dart';
import '../../../global_variables.dart';
import '../../Create/Create Single/create_single_helper.dart';
import '../Charts Multi/line_data.dart';
import '../Charts Single/chart_single_line_extra.dart';

class ChartMultiTime extends ConsumerStatefulWidget {
  const ChartMultiTime(this.listSpots, {super.key});

  final List<List<FlSpot>> listSpots;

  @override
  ConsumerState<ChartMultiTime> createState() => ChartMultiTimeState();
}

class ChartMultiTimeState extends ConsumerState<ChartMultiTime> {
  Duration stepDuration = const Duration(milliseconds: 15);
  List<FlSpot> animatedSpotHill = [];
  List<FlSpot> animatedSpotDepth = [];
  List<FlSpot> animatedSpotDPLL = [];
  List<FlSpot> animatedSpotWalk = [];

  int step = 1;
  double maxY = 0;
  double maxX = 0;
  bool isCollapsed = true;
  bool isFullScreen = false;

  @override
  initState() {
    super.initState();
    playAgainAnimation();
    maxY = findMaxYMulti(widget.listSpots);
    maxX = findMaxXMulti(widget.listSpots);
  }

  playAgainAnimation() {
    step = findRightStep();
    print('Length spots: ${widget.listSpots.length}');
    animatedSpotHill = [];
    animatedSpotDepth = [];
    animatedSpotDPLL = [];
    animatedSpotWalk = [];
    Timer.periodic(stepDuration, (timer) {
      setState(() {
        if (animatedSpotHill.length < widget.listSpots[0].length) {
          for (var i = 0; i < step; i++) {
            if (animatedSpotHill.length < widget.listSpots[0].length) {
              animatedSpotHill
                  .add(widget.listSpots[0][animatedSpotHill.length]);
              animatedSpotDepth
                  .add(widget.listSpots[1][animatedSpotDepth.length]);
              animatedSpotDPLL
                  .add(widget.listSpots[2][animatedSpotDPLL.length]);
              animatedSpotWalk
                  .add(widget.listSpots[3][animatedSpotWalk.length]);
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
    stepDuration = const Duration(milliseconds: 15);
    if (widget.listSpots[0].length > 40) {
      return (widget.listSpots[0].length / 25).round();
    } else if (widget.listSpots[0].length > 25) {
      stepDuration = const Duration(milliseconds: 25);
      return 1;
    } else {
      stepDuration = const Duration(milliseconds: 35);
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

  chart() => (animatedSpotHill.isNotEmpty)
      ? LineChart(
          duration: const Duration(milliseconds: 100),
          LineChartData(
            lineTouchData: lineTouchData(context, LineType.multi),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color.fromARGB(255, 54, 54, 54),
              ),
            ),
            titlesData: titleData(LineType.time),
            gridData: const FlGridData(drawHorizontalLine: false),
            //minX: widget.listSpots[0].x.toDouble(),
            maxX: maxX,
            //
            //widget.listSpots[widget.listSpots.length - 1].x.toDouble(),
            minY: 0,
            maxY: isCollapsed ? maxY : ((timeOut + 1) * 1000).toDouble(),
            lineBarsData: [
              lineChartBarData(animatedSpotHill, orange1),
              lineChartBarData(animatedSpotDepth, orange2),
              lineChartBarData(animatedSpotDPLL, orange3),
              lineChartBarData(animatedSpotWalk, orange4),
            ],
          ),
        )
      : const SizedBox();
}
