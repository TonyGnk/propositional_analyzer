import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Charts/Charts Single/charts_single_main.dart';

class ChartSingle extends ConsumerStatefulWidget {
  const ChartSingle({super.key});

  @override
  ConsumerState<ChartSingle> createState() => ChartSingleState();
}

final hideSuccessProvider = StateProvider<bool>((ref) => false);

final hideTimeProvider = StateProvider<bool>((ref) => false);

chartHeaderSingle(
  String label,
  void Function() onPressedRepeat,
  void Function() onPressedCollapse,
  void Function() onPressedFullScreen,
  bool isCollapsed,
  bool isFullScreen,
) =>
    Consumer(
      builder: (context, ref, _) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Row(
          children: [
            Text(label, style: Theme.of(context).textTheme.labelSmall),
            const Expanded(child: SizedBox()),
            repeatIcon(context, onPressedRepeat),
            collapseIcon(context, onPressedCollapse, isCollapsed),
            fullScreenIcon(context, onPressedFullScreen, isFullScreen),
          ],
        ),
      ),
    );

repeatIcon(
  BuildContext context,
  void Function() onPressed,
) =>
    (MediaQuery.of(context).size.width > 410)
        ? IconButton(
            tooltip: 'Repeat Animation',
            icon: const Icon(Icons.animation_outlined),
            onPressed: onPressed,
          )
        : const SizedBox();

collapseIcon(
  BuildContext context,
  void Function() onPressed,
  bool isSelected,
) =>
    (MediaQuery.of(context).size.width > 350)
        ? IconButton(
            icon: const Icon(Icons.zoom_in_outlined),
            onPressed: onPressed,
            isSelected: isSelected,
            selectedIcon: const Icon(Icons.zoom_out_outlined),
          )
        : const SizedBox();

fullScreenIcon(
  BuildContext context,
  void Function() onPressed,
  bool isSelected,
) =>
    IconButton(
      icon: const Icon(Icons.fullscreen_outlined),
      onPressed: onPressed,
      isSelected: isSelected,
      selectedIcon: const Icon(Icons.fullscreen_exit_outlined),
    );

double findMaxY(List<FlSpot> spots) {
  double maxY = 0;
  for (var i = 0; i < spots.length; i++) {
    if (spots[i].y > maxY) {
      maxY = spots[i].y;
    }
  }
  return maxY;
}

double findMaxYMulti(List<List<FlSpot>> spots) {
  double maxY = 0;
  for (var i = 0; i < spots.length; i++) {
    for (var j = 0; j < spots[i].length; j++) {
      if (spots[i][j].y > maxY) {
        maxY = spots[i][j].y;
      }
    }
  }
  return maxY;
}

double findMaxXMulti(List<List<FlSpot>> spots) {
  double maxX = 0;
  for (var i = 0; i < spots.length; i++) {
    for (var j = 0; j < spots[i].length; j++) {
      if (spots[i][j].x > maxX) {
        maxX = spots[i][j].x;
      }
    }
  }
  return maxX;
}
