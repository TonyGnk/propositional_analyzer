import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Charts/Charts Single/charts_single_main.dart';

class ChartSingle extends ConsumerStatefulWidget {
  const ChartSingle({super.key});

  @override
  ConsumerState<ChartSingle> createState() => ChartSingleState();
}

// shortUp() {
//   for (var i = 0; i < spots1.length; i++) {
//     if (spots1[i].y != 1) {
//       firstNotOneUpSpot = spots1[i];
//       break;
//     }
//   }
//   setState(() {
//     firstNotOneUp = (firstNotOneUpSpot.x * N).round();
//     for (var i = 0; i < firstNotOneUp; i++) {
//       animatedSpotUp.removeAt(0);
//     }
//   });
// }

chartHeaderSuccess(
  String label,
  void Function() onPressedRepeat,
) =>
    Consumer(
      builder: (context, ref, _) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: show2
            ? Row(
                children: [
                  Text(label, style: Theme.of(context).textTheme.labelSmall),
                  const Expanded(child: SizedBox()),
                  repeatIcon(context, onPressedRepeat),

                  // collapseIcon(context),
                  // fullScreenIcon(),
                ],
              )
            : const SizedBox(),
      ),
    );

repeatIcon(BuildContext context, void Function() onPressed) =>
    (MediaQuery.of(context).size.width > 410)
        ? IconButton(
            tooltip: 'Repeat Animation',
            icon: const Icon(Icons.animation_outlined),
            onPressed: onPressed,
          )
        : const SizedBox();

// collapseIcon(BuildContext context) => (MediaQuery.of(context).size.width > 350)
//     ? IconButton(
//         icon: const Icon(Icons.auto_graph_outlined),
//         onPressed: () async {
//           if (isFirst) {
//             setState(() {
//               collapsedUp = !collapsedUp;
//               //shortUp();
//             });
//           } else {
//             setState(() {
//               collapsedDown = !collapsedDown;
//             });
//           }
//         },
//       )
//     : const SizedBox();

// fullScreenIcon()=> IconButton(
//       icon: isFullScreen
//           ? const Icon(Icons.fullscreen_exit)
//           : const Icon(Icons.fullscreen),
//       onPressed: () async {
//         fullScreen(ref, isFirst);
//       },
//     );