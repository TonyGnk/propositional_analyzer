import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global_variables.dart';
import '../../Create/Create Single/create_single_helper.dart';
import 'charts_single_state.dart';
import 'success_line.dart';
import 'time_line.dart';

class ChartSingleState extends ConsumerState<ChartSingle> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () => chartsSingleReturn(ref));
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
}
