import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../UI/Routed Screen/app_bar.dart';
import '../../../global_variables.dart';
import '../../Create/Create Single/create_single_helper.dart';
import '../Charts Single/chart_single_line_extra.dart';

class ChartSuccess extends ConsumerStatefulWidget {
  const ChartSuccess(this.spots, {super.key});

  final List<FlSpot> spots;

  @override
  ConsumerState<ChartSuccess> createState() => ChartSuccessState();
}

class ChartSuccessState extends ConsumerState<ChartSuccess> {
  Duration stepDuration = const Duration(milliseconds: 30);
  List<FlSpot> animatedSpotUp = [];
  bool isCollapsed = false;
  bool isFullScreen = false;
  int? curvingIndex;
  double minXVariable = 0;
  int step = 1;

  @override
  initState() {
    super.initState();
    playAgainAnimation();
    curvingIndex = findCurvingIndex(widget.spots);
    minXVariable = widget.spots[curvingIndex!].x;
  }

  playAgainAnimation() {
    step = findRightStep();
    animatedSpotUp = [];
    Timer.periodic(stepDuration, (timer) {
      setState(() {
        if (animatedSpotUp.length < widget.spots.length) {
          for (var i = 0; i < step; i++) {
            if (animatedSpotUp.length < widget.spots.length) {
              animatedSpotUp.add(widget.spots[animatedSpotUp.length]);
            } else {
              break;
            }
          }
        } else {
          timer.cancel();
        }
      });
    });
    setState(() {
      isCollapsed = false;
    });
  }

  fullScreen() {
    setState(() {
      if (isFullScreen) {
        ref.read(appBarIsEnableProvider.notifier).state = true;
        ref.read(hideTimeProvider.notifier).state = false;
        isFullScreen = false;
      } else {
        ref.read(appBarIsEnableProvider.notifier).state = false;
        ref.read(hideTimeProvider.notifier).state = true;
        isFullScreen = true;
      }
    });
  }

  collapseLine() {
    if (isCollapsed) {
      playAgainAnimation();
      setState(() {
        isCollapsed = false;
      });
    } else {
      animatedSpotUp = [];
      Timer.periodic(stepDuration, (timer) {
        setState(() {
          if (animatedSpotUp.length < (widget.spots.length - curvingIndex!)) {
            for (var i = 0; i < step; i++) {
              if (animatedSpotUp.length <
                  (widget.spots.length - curvingIndex!)) {
                animatedSpotUp
                    .add(widget.spots[curvingIndex! + animatedSpotUp.length]);
              } else {
                break;
              }
            }
          } else {
            timer.cancel();
          }
        });
      });
      setState(() {
        isCollapsed = true;
      });
    }
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
    final hideWidget = ref.watch(hideSuccessProvider);
    return !hideWidget
        ? Expanded(
            child: Column(
              children: [
                chartHeaderSingle(
                  'Attainability to M/N',
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

  chart() => (animatedSpotUp.isNotEmpty)
      ? LineChart(
          duration: const Duration(milliseconds: 1000),
          LineChartData(
            lineTouchData: lineTouchData(context, LineType.success),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color.fromARGB(255, 54, 54, 54),
              ),
            ),
            titlesData: titleData(LineType.success),
            gridData: const FlGridData(drawHorizontalLine: false),
            minX: isCollapsed ? minXVariable : widget.spots[0].x.toDouble(),
            maxX: spots1[widget.spots.length - 1].x.toDouble(),
            minY: 0,
            maxY: numberOfTests.toDouble(),
            lineBarsData: singleBarDataSuccess(animatedSpotUp),
          ),
        )
      : const SizedBox();
}
