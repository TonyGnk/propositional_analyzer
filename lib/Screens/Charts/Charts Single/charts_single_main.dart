// ignore_for_file: avoid_print

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';
import '../../Search/Search Share/algorithm_bridge.dart';
import 'charts_single_state.dart';

class ChartSingle extends ConsumerStatefulWidget {
  const ChartSingle({super.key});

  @override
  ConsumerState<ChartSingle> createState() => _ChartSingleState();
}

bool show1 = true;
bool show2 = true;
bool collapsedUp = false;
bool collapsedDown = false;
List<FlSpot> animatedSpotUp = [const FlSpot(1, 1)];
List<FlSpot> animatedSpotDown = [const FlSpot(1, 1)];
//First FlSpot of spots1 which is not 1
int firstNotOneUp = 1;
FlSpot firstNotOneUpSpot = const FlSpot(1, 1);

class _ChartSingleState extends ConsumerState<ChartSingle> {
  List<Color> gradientColors = [
    const Color.fromRGBO(199, 109, 35, 1),
    const Color.fromRGBO(167, 123, 3, 1),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      chartsSingleReturn(ref);
    });
    playAgainAnimationUp();
    playAgainAnimationDown();
    unawaited(player.setSource(DeviceFileSource(songPath)));
    unawaited(player.resume());
  }

  //Find the first FlSpot of spots1 which is not 1. Remove from start to this FlSpot
  shortUp() {
    for (var i = 0; i < spots1.length; i++) {
      if (spots1[i].y != 1) {
        firstNotOneUpSpot = spots1[i];
        break;
      }
    }
    setState(() {
      firstNotOneUp = (firstNotOneUpSpot.x * N).round();
      //print('index: $index');
      //Remove from start to this FlSpot
      for (var i = 0; i < firstNotOneUp; i++) {
        animatedSpotUp.removeAt(0);
      }
    });
  }

  playAgainAnimationUp() {
    animatedSpotUp = [];
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (animatedSpotUp.length < spots1.length) {
          for (var i = 0; i < 10; i++) {
            if (animatedSpotUp.length < spots1.length) {
              animatedSpotUp.add(spots1[animatedSpotUp.length]);
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

  playAgainAnimationDown() {
    animatedSpotDown = [];
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (animatedSpotDown.length < spots2.length) {
          for (var i = 0; i < 10; i++) {
            if (animatedSpotDown.length < spots2.length) {
              animatedSpotDown.add(spots2[animatedSpotDown.length]);
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

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => Container(
          padding: const EdgeInsets.all(7.0),
          child: animatedColumn(
            Column(
              children: [
                show1 ? row(true) : const SizedBox(),
                show1 ? Expanded(child: lineChart(true)) : const SizedBox(),
                (show1 && show2)
                    ? const SizedBox(height: 20)
                    : const SizedBox(),
                show2 ? row(false) : const SizedBox(),
                show2 ? Expanded(child: lineChart(false)) : const SizedBox(),
              ],
            ),
          ),
        ),
      );

  row(bool isFirst) => Consumer(
        builder: (context, ref, _) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Row(
            children: [
              Text(
                isFirst ? 'Attainability to M/N' : 'Run Time to M/N',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: SizedBox()),
              (MediaQuery.of(context).size.width > 410)
                  ? IconButton(
                      tooltip: 'Repeat Animation',
                      icon: const Icon(Icons.animation_outlined),
                      onPressed: () async {
                        if (isFirst) {
                          playAgainAnimationUp();
                        } else {
                          playAgainAnimationDown();
                        }
                      },
                    )
                  : const SizedBox(),
              (MediaQuery.of(context).size.width > 350)
                  ? IconButton(
                      icon: const Icon(Icons.auto_graph_outlined),
                      onPressed: () async {
                        if (isFirst) {
                          setState(() {
                            collapsedUp = !collapsedUp;
                            shortUp();
                          });
                        } else {
                          setState(() {
                            collapsedDown = !collapsedDown;
                          });
                        }
                      },
                    )
                  : const SizedBox(),
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
        duration: const Duration(milliseconds: 1000),
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
          // minX: collapsedUp ? firstNotOneUp.toDouble() : spots1[0].x,
          maxX: spots1[spots1.length - 1].x,
          maxY: isFirst ? 1 : spots2[spots2.length - 1].y,
          minY: isFirst ? 0 : 0,
          lineBarsData: [
            LineChartBarData(
              barWidth: 3,
              isCurved: false,
              spots: isFirst ? animatedSpotUp : animatedSpotDown,
              gradient: LinearGradient(colors: gradientColors),
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
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
