import 'package:flutter/material.dart';

import '../../../../global_variables.dart';
import 'segmented_share.dart';

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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: Container(
            height: 50,
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
            clipBehavior: Clip.antiAlias,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                selectItem1(0),
                selectItem2(1),
                selectItem3(2),
                selectItem4(3),
              ],
            ),
          ),
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(5),
          height: 50,
          decoration: (id == selected)
              ? BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(cornerSize - 2),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(cornerSize - 2),
                ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              overlayColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 139, 120, 112).withOpacity(0.1)),
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
                        color: (id == selected)
                            ? Theme.of(context).textTheme.headlineLarge!.color
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      algorithmNamesMap[id]!,
                      style: (id == selected)
                          ? Theme.of(context).textTheme.headlineLarge
                          : Theme.of(context).textTheme.bodyMedium,
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
