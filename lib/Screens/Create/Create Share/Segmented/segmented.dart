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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cornerSize),
              border: Border.all(
                color: Theme.of(context)
                    .menuButtonTheme
                    .style!
                    .foregroundColor!
                    .resolve({})!,
              ),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height: openedMenu ? 184 : 46,
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
            ),
          ),
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
            topLeft: Radius.circular(cornerSize),
            topRight: Radius.circular(cornerSize),
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
            bottomLeft: Radius.circular(cornerSize),
            bottomRight: Radius.circular(cornerSize),
          ),
        ),
        id,
      );

  selectItem5(int id) => animatedRow(
        0,
        const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(cornerSize),
            bottomRight: Radius.circular(cornerSize),
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
                  borderRadius: BorderRadius.circular(cornerSize),
                ),
          clipBehavior: Clip.antiAlias,
          transform: (selected == id && matrix)
              ? Matrix4.translationValues(0, findD(id), 0)
              : Matrix4.translationValues(0, 0, 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              overlayColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 139, 120, 112).withOpacity(0.1)),
              onTap: () => onPressed(id),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                child: Row(
                  children: [
                    Center(
                      child: Icon(
                        algorithmIconMap[id]!,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      algorithmNamesMap[id]!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Expanded(child: SizedBox()),
                    !openedB
                        ? Icon(
                            Icons.expand_more_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : (openedMenu && selected == id)
                            ? Icon(
                                Icons.check,
                                color: Theme.of(context).colorScheme.primary,
                              )
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
