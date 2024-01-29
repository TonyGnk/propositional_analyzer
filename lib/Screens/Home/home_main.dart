import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_fields.dart';

import 'home_state.dart';
import 'segmented.dart';
import 'segmented2.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      homeReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: animatedColumn(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              welcomeToText,
              titleText(context),
              const Expanded(flex: 1, child: SizedBox()),
              loadButton(context),
              const SizedBox(height: 16),
              createButton(context),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

//
}
