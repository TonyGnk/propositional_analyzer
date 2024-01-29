import 'package:flutter/material.dart';

import '../../Services/constants.dart';

class SegmentedControl extends StatefulWidget {
  const SegmentedControl({super.key});

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  double tr = 0;
  bool openedMenu = false;
  bool openedB = false;
  bool showOptionsOpacity = false;
  bool matrix = false;
  int selected = 0;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: openedMenu ? 202 : 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize - 1),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            width: 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(7, 0, 7, 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectItem1(0),
            selectItem2(1),
            selectItem3(2),
            selectItem4(3),
            selectItem5(4),
          ],
        ),
      );

  onPressed(int n) {
    if (openedMenu) {
      toClose(n);
    } else {
      toOpen(n);
    }
  }

  toOpen(int n) async {
    setState(() {
      openedMenu = true;
    });

    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      matrix = true;
    });

    await Future.delayed(const Duration(milliseconds: 250));
    setState(() {
      openedB = true;
      matrix = false;
      showOptionsOpacity = true;
    });
  }

  toClose(int n) async {
    setState(() {
      matrix = false;
      selected = n;
    });
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {
      showOptionsOpacity = false;
    });
    await Future.delayed(const Duration(milliseconds: 250));
    setState(() {
      matrix = true;
    });
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {
      openedMenu = false;
    });
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {
      matrix = false;
      openedB = false;
    });
  }

  selectItem1(int id) => animatedRow(
        50,
        const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cornerSize - 1),
            topRight: Radius.circular(cornerSize - 1),
          ),
        ),
        id,
      );
  selectItem2(int id) => animatedRow(
        50,
        const BoxDecoration(),
        id,
      );

  selectItem3(int id) => animatedRow(
        50,
        const BoxDecoration(),
        id,
      );

  selectItem4(int id) => animatedRow(
        50,
        const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(cornerSize - 1),
            bottomRight: Radius.circular(cornerSize - 1),
          ),
        ),
        id,
      );

  selectItem5(int id) => animatedRow(
        0,
        const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(cornerSize - 1),
            bottomRight: Radius.circular(cornerSize - 1),
          ),
        ),
        id,
      );

  animatedRow(
    double height,
    BoxDecoration decoration,
    int id,
  ) =>
      !openedB
          ? (selected == id)
              ? openedRow(decoration, id, height)
              : const SizedBox()
          : openedRow(decoration, id, height);

  openedRow(
    BoxDecoration decoration,
    int id,
    double height,
  ) =>
      AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: (selected != id)
            ? showOptionsOpacity
                ? 1
                : 0
            : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: height,
          decoration: openedB
              ? decoration
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(cornerSize - 1),
                ),
          clipBehavior: Clip.antiAlias,
          transform: (selected == id && matrix)
              ? Matrix4.translationValues(0, findD(id), 0)
              : Matrix4.translationValues(0, 0, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              onTap: () => onPressed(id),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                child: Row(
                  children: [
                    Center(
                      child: Icon(
                        algorithmIconMap[id]!,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      algorithmMap[id]!,
                      style: TextStyle(
                        fontFamily: 'Play',
                        fontSize: 16,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.9),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    !openedB
                        ? const Icon(
                            Icons.expand_more_outlined,
                          )
                        : (openedMenu && selected == id)
                            ? const Icon(Icons.check)
                            : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  double findD(int id) {
    if (!openedB) {
      return id * (50);
    } else {
      return id * (-50);
    }
  }
}

Map<int, String> algorithmMap = {
  0: 'Hill Climbing',
  1: 'DepthFirst',
  2: 'DPLL',
  3: 'Walkstat',
  4: 'Genetic',
};

Map<int, IconData> algorithmIconMap = {
  0: Icons.power_input_outlined,
  1: Icons.grid_goldenratio_outlined,
  2: Icons.join_right_sharp,
  3: Icons.stacked_bar_chart_outlined,
  4: Icons.dangerous_outlined,
};
