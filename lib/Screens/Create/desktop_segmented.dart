import 'package:flutter/material.dart';

import '../../Services/global_variables.dart';
import 'segmented.dart';

class DesktopSegmented extends StatefulWidget {
  const DesktopSegmented({super.key});

  @override
  State<DesktopSegmented> createState() => _DesktopSegmentedState();
}

class _DesktopSegmentedState extends State<DesktopSegmented> {
  double tr = 0;
  bool openedMenu = false;
  bool openedB = false;
  bool showOptionsOpacity = false;

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectItem1(0),
            selectItem2(1),
            selectItem3(2),
            selectItem4(3),
          ],
        ),
      );

  onPressed(int n) {
    toClose(n);
  }

  toClose(int n) async {
    setState(() {
      selected = n;
    });
  }

  selectItem1(int id) => openedRow(id, 12);
  selectItem2(int id) => openedRow(id, 11);
  selectItem3(int id) => openedRow(id, 7);
  selectItem4(int id) => openedRow(id, 10);

  openedRow(
    int id,
    int flex,
  ) =>
      Expanded(
        flex: flex,
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 50,
          decoration: (id == selected)
              ? BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(cornerSize - 3),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                    width: 1,
                  ),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(cornerSize - 3),
                ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor:
                  Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              onTap: () => onPressed(id),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        algorithmIconMap[id]!,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                    const SizedBox(width: 4),
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
