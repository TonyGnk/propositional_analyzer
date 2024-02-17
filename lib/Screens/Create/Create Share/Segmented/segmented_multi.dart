import 'package:flutter/material.dart';

import '../../../../global_variables.dart';
import 'segmented_share.dart';

class SegmentedControlMulti extends StatefulWidget {
  const SegmentedControlMulti({super.key});

  @override
  State<SegmentedControlMulti> createState() => _SegmentedControlMultiState();
}

class _SegmentedControlMultiState extends State<SegmentedControlMulti> {
  @override
  Widget build(BuildContext context) =>
      (MediaQuery.of(context).size.width > 600)
          ? container(desktopSegmentedMulti(), true)
          : container(mobileSegmentedMulti(), false);

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
            onTap: () => setState(() => algorithmFunctionMap[id]!()),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      algorithmIconMap[id]!,
                      color: (isSelected(id))
                          ? Theme.of(context).textTheme.headlineLarge!.color
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    algorithmNamesMap[id]!,
                    style: (isSelected(id))
                        ? Theme.of(context).textTheme.headlineLarge
                        : Theme.of(context).textTheme.bodyMedium,
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

  container(Widget child, bool isDesktop) => Card(
        elevation: isDesktop ? 0 : null,
        child: Container(
          height: isDesktop ? 50 : 117,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerSize - 1),
            border:
                (isDesktop && Theme.of(context).brightness == Brightness.light)
                    ? Border.all(
                        color: Theme.of(context).splashColor,
                        width: 2,
                      )
                    : Border.all(
                        color: Theme.of(context)
                            .menuButtonTheme
                            .style!
                            .foregroundColor!
                            .resolve({})!,
                      ),
          ),
          padding: const EdgeInsets.all(5),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      );
}

Map<int, Function> algorithmFunctionMap = {
  0: () => selectedHill = !selectedHill,
  1: () => selectedDepth = !selectedDepth,
  2: () => selectedDPLL = !selectedDPLL,
  3: () => selectedWalk = !selectedWalk,
  4: () => selectedWalk = !selectedWalk,
};
