import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'hom_title.dart';
import 'home_buttons.dart';
import 'home_state.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 27),
        child: animatedColumn(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              welcomeToText,
              titleText(context),
              const Expanded(child: SizedBox()),
              newCreateButton,
              const SizedBox(height: 6),
              newLoadButton,
              const Expanded(flex: 2, child: SizedBox()),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

//
}
