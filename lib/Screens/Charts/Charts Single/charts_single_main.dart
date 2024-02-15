import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import '../../../global_variables.dart';
import '../../../UI/Routed Screen/app_bar.dart';
import '../../Create/Create Single/create_single_helper.dart';
import 'chart_single_line_extra.dart';
import 'charts_single_state.dart';
import 'success_line.dart';
import 'time_line.dart';

bool show1 = true;
bool show2 = true;
bool collapsedUp = false;
bool collapsedDown = false;
List<FlSpot> animatedSpotDown = [const FlSpot(1, 1)];
int firstNotOneUp = 1;
FlSpot firstNotOneUpSpot = const FlSpot(1, 1);

class ChartSingleState extends ConsumerState<ChartSingle> {
  List<Color> gradientColors = [
    const Color.fromRGBO(199, 109, 35, 1),
    const Color.fromRGBO(167, 123, 3, 1),
  ];

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () => chartsSingleReturn(ref));
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
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(7.0),
        child: animatedColumn(
          Column(
            children: [
              Expanded(child: ChartSuccess(spots1)),
              Expanded(child: ChartTime(spots2)),
            ],
          ),
        ),
      );

  // findIcon(isFirst, WidgetRef ref) => isFirst
  //     ? IconButton(
  //         icon: isFullScreen
  //             ? const Icon(Icons.fullscreen_exit)
  //             : const Icon(Icons.fullscreen),
  //         onPressed: () async {},
  //       )
  //     : IconButton(
  //         icon: isFullScreen
  //             ? const Icon(Icons.fullscreen_exit)
  //             : const Icon(Icons.fullscreen),
  //         onPressed: () async {},
  //       );

  // bool isFullScreen = false;
  // fullScreen(WidgetRef ref, bool isFirst) async {
  //   if (isFullScreen) {
  //     setState(() {
  //       isFirst ? show2 = true : show1 = true;
  //       ref.read(appBarIsEnableProvider.notifier).state = true;
  //       isFullScreen = false;
  //     });
  //     FullScreenWindow.setFullScreen(false);
  //   } else {
  //     setState(() {
  //       isFirst ? show2 = false : show1 = false;
  //       ref.read(appBarIsEnableProvider.notifier).state = false;
  //       isFullScreen = true;
  //     });
  //     FullScreenWindow.setFullScreen(true);
  //   }
  // }
}
