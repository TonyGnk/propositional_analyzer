import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global_variables.dart';
import 'segmented_share.dart';

class SegmentedControlMulti extends StatefulWidget {
  const SegmentedControlMulti({super.key});

  @override
  State<SegmentedControlMulti> createState() => _SegmentedControlMultiState();
}

class _SegmentedControlMultiState extends State<SegmentedControlMulti> {
  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) {
          final isDesktop = ref.watch(isDesktopProvider);
          return isDesktop
              ? container(desktopSegmentedMulti(), true)
              : container(mobileSegmentedMulti(), false);
        },
      );
  desktopSegmentedMulti() => Row(
        children: [
          Expanded(child: checkRow(0)),
          const SizedBox(width: 5),
          Expanded(child: checkRow(1)),
          const SizedBox(width: 5),
          Expanded(child: checkRow(2)),
          const SizedBox(width: 5),
          Expanded(child: checkRow(3)),
        ],
      );
  mobileSegmentedMulti() => Row(
        children: [
          Expanded(
            child: Column(
              children: [
                checkRow(0),
                const SizedBox(height: 5),
                checkRow(1),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              children: [
                checkRow(2),
                const SizedBox(height: 5),
                checkRow(3),
              ],
            ),
          ),
        ],
      );

  checkRow(int id) => Container(
        height: 50,
        decoration: isSelected(id)
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(cornerSize - 3),
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
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
            onTap: () => setState(() => algorithmFunctionMap[id]!()),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      algorithmIconMap[id]!,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  const SizedBox(width: 5),
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
                ],
              ),
            ),
          ),
        ),
      );

  isSelected(int id) {
    if (id == 0) {
      return selectedHill;
    } else if (id == 1) {
      return selectedDepth;
    } else if (id == 2) {
      return selectedDPLL;
    } else if (id == 3) {
      return selectedWalk;
    } else if (id == 4) {
      return selectedWalk;
    }
  }

  container(Widget child, bool isDesktop) => Container(
        height: isDesktop ? 50 : 117,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize - 1),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(5),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(7, 0, 7, 8),
        child: child,
      );
}

Map<int, Function> algorithmFunctionMap = {
  0: () => selectedHill = !selectedHill,
  1: () => selectedDepth = !selectedDepth,
  2: () => selectedDPLL = !selectedDPLL,
  3: () => selectedWalk = !selectedWalk,
  4: () => selectedWalk = !selectedWalk,
};
