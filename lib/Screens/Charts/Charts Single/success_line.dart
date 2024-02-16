import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';
import '../../Create/Create Single/create_single_helper.dart';
import 'chart_single_line_extra.dart';

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

  findRightStep() {
    stepDuration = const Duration(milliseconds: 30);
    if (widget.spots.length < 25) {
      stepDuration = const Duration(milliseconds: 300);
      return 1;
    } else {
      return (widget.spots.length / 25).round();
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          chartHeaderSuccess(
            'Attainability to M/N',
            playAgainAnimation,
            collapseLine,
            isCollapsed,
          ),
          Expanded(child: chart()),
        ],
      );

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
            gridData: const FlGridData(drawHorizontalLine: true),
            minX: isCollapsed ? minXVariable : widget.spots[0].x.toDouble(),
            maxX: widget.spots[widget.spots.length - 1].x.toDouble(),
            minY: 0,
            maxY: numberOfTests.toDouble(),
            lineBarsData: singleBarDataSuccess(animatedSpotUp),
          ),
        )
      : const SizedBox();
}
