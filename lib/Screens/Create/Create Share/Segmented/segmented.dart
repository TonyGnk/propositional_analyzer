import 'package:flutter/material.dart';

import '../../../../global_variables.dart';
import 'segmented_share.dart';

class SegmentedControl extends StatefulWidget {
  const SegmentedControl({super.key});

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  bool openedMenu = false;
  bool openedB = false;
  bool showOptionsOpacity = false;
  bool matrix = false;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: openedMenu ? 186 : 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize - 1),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            width: 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(7, 0, 7, 8),
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

    await Future.delayed(const Duration(milliseconds: 40));
    setState(() {
      matrix = true;
    });

    await Future.delayed(const Duration(milliseconds: 200));
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
    await Future.delayed(const Duration(milliseconds: 40));
    setState(() {
      showOptionsOpacity = false;
    });
    await Future.delayed(const Duration(milliseconds: 200));
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
        46,
        const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cornerSize - 1),
            topRight: Radius.circular(cornerSize - 1),
          ),
        ),
        id,
      );
  selectItem2(int id) => animatedRow(46, const BoxDecoration(), id);

  selectItem3(int id) => animatedRow(46, const BoxDecoration(), id);

  selectItem4(int id) => animatedRow(
        46,
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
                      algorithmNamesMap[id]!,
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
      return id * (46);
    } else {
      return id * (-46);
    }
  }
}
