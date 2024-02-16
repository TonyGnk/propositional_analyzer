import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global_variables.dart';
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
      //const LineChartSample10()
      (MediaQuery.of(context).size.width > 600) ? desktopView() : mobileView(),
    );
  }

  mobileView() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 37),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            welcomeToText(context),
            titleText(context),
            const Expanded(child: SizedBox()),
            newCreateButton,
            const SizedBox(height: 4),
            newCreateMultiButton,
            const SizedBox(height: 4),
            helpContainer,
            const SizedBox(height: 4),
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
            welcomeToText(context),
            titleText(context),
            const Expanded(flex: 5, child: SizedBox()),
            newCreateButton,
            newCreateMultiButton,
            helpContainer,
            newLoadButton,
            const Expanded(flex: 5, child: SizedBox()),
          ],
        ),
        500,
        const EdgeInsets.symmetric(horizontal: 42),
      );
}
