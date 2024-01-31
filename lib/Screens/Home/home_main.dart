import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/global_variables.dart';
import '../shared.dart';
import 'home_buttons.dart';
import 'home_state.dart';
import 'home_title.dart';

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
  Widget build(BuildContext context) {
    final isDesktop = ref.watch(isDesktopProvider);
    return animatedColumn(
      isDesktop ? desktopView() : mobileView(),
    );
  }

  mobileView() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 37),
        child: Column(
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
            const Expanded(flex: 1, child: SizedBox()),
            const SizedBox(height: 10),
          ],
        ),
      );

  desktopView() => desktopFrame(
        context,
        Column(
          children: [
            const Expanded(flex: 3, child: SizedBox()),
            welcomeToText,
            titleText(context),
            const Expanded(flex: 5, child: SizedBox()),
            newCreateButton,
            newLoadButton,
            const Expanded(flex: 5, child: SizedBox()),
          ],
        ),
      );
}
