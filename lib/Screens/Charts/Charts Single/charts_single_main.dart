import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global_variables.dart';
import '../../Create/Create Single/create_single_helper.dart';
import 'charts_single_state.dart';
import '../Charts Share/success_line.dart';
import '../Charts Share/time_line.dart';

class ChartSingleState extends ConsumerState<ChartSingle> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () => chartsSingleReturn(ref));
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8.0),
        child: animatedColumn(
          Column(
            children: [
              ChartSuccess(spots1),
              ChartTime(spots2),
            ],
          ),
        ),
      );
}
