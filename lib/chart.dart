import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: 800,
        height: 300,
        child: Consumer(builder: (context, WidgetRef ref, __) {
          final spots = ref.watch(spotsProvider);
          return LineChart(
            LineChartData(
              maxY: 1,
              minY: 0,
              lineBarsData: [
                LineChartBarData(
                  barWidth: 1.0,
                  isCurved: false,
                  spots: spots,
                )
              ],
            ),
          );
        }),
      );
}

//Empty list of FlSpot
final spotsProvider = StateProvider((ref) => <FlSpot>[]);
