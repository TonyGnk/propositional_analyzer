import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global_variables.dart';
import '../Charts Share/multi_time_line.dart';
import '../Charts Share/success_line.dart';
import 'charts_multi_state.dart';

class ChartMulti extends ConsumerStatefulWidget {
  const ChartMulti({super.key});

  @override
  ConsumerState<ChartMulti> createState() => _ChartMultiState();
}

class _ChartMultiState extends ConsumerState<ChartMulti> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => chartsMultiReturn(ref));
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ChartSuccess(spots1),
            ChartMultiTime(
              [spots2Hill, spots2Depth, spots2DPLL, spots2Walk],
            ),
          ],
        ),
      );
}
