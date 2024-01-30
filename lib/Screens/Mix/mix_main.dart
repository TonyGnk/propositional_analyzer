import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Charts/chart_main.dart';
import '../Create/create_main.dart';
import '../Create/segmented.dart';
import '../Create/sliders.dart';
import '../screen_list.dart';
import 'mix_state.dart';

final secondaryScreenProvider =
    StateProvider<ScreenDestination>((ref) => ScreenDestination.create);

class Mix extends ConsumerStatefulWidget {
  const Mix({super.key});

  @override
  ConsumerState<Mix> createState() => _MixState();
}

class _MixState extends ConsumerState<Mix> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mixReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) {
          final secondaryScreen = ref.watch(secondaryScreenProvider);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: animatedColumn(
              Row(
                children: [
                  SizedBox(width: 350, child: screenMap[secondaryScreen]!),
                  Expanded(flex: 1, child: Chart()),
                ],
              ),
            ),
          );
        },
      );
}
