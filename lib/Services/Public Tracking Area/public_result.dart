import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../public_left_column.dart';

Widget resultPanel() => Consumer(builder: (context, ref, _) {
      // ignore: unused_local_variable
      final previousInput = ref.watch(savedInputProvider);
      final cost = ref.watch(resultCostProvider);
      final count = ref.watch(resultCountProvider);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3),
          resultsAppBar(ref, previousInput, cost, count),
          const SizedBox(height: 3),
          const Expanded(child: SizedBox()),
        ],
      );
    });

Widget resultsAppBar(
  WidgetRef ref,
  String previousInput,
  int cost,
  int count,
) =>
    Row(
      children: [
        const SizedBox(width: 8),
        headerText('Results '),
        const Expanded(child: SizedBox()),
        commandsText((count - 1).toString()),
        const Icon(Icons.bar_chart_outlined),
        const Expanded(child: SizedBox()),
        commandsText(cost.toString()),
        const Icon(Icons.bolt_outlined, color: Colors.orange),
        const Expanded(flex: 5, child: SizedBox()),
        IconButton(
          onPressed: () => ref.read(isOnTrackingProvider.notifier).state = true,
          icon: const Icon(Icons.insights_outlined),
        ),
        IconButton(
          onPressed: () {
            ref.read(runOnceProvider.notifier).state = false;
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );

costText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Play',
      ),
    );

commandsText(String text) => Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Play',
      ),
    );

final savedInputProvider = StateProvider<String>((ref) => '');
final resultCountProvider = StateProvider<int>((ref) => 0);
final resultCostProvider = StateProvider<int>((ref) => 0);
