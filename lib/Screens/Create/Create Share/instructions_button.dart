import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';

final isHoveredProviderModernButton = StateProvider<bool>((ref) => false);

class ExamplesButton extends StatefulWidget {
  const ExamplesButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<ExamplesButton> createState() => _ExamplesButtonState();
}

class _ExamplesButtonState extends State<ExamplesButton> {
  int gradientIndex = 0;
  double scale = 1.0;
  int elev = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (event) {
          setState(() {
            scale = 0.97;
            elev = 2;
          });
        },
        onExit: (event) {
          setState(() {
            scale = 1.0;
            elev = 4;
          });
        },
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {});
            widget.onTap();
          },
          child: AnimatedScale(
            scale: scale,
            duration: basicDuration,
            child: container(context),
          ),
        ),
      );

  container(BuildContext context) => Consumer(builder: (context, ref, _) {
        final isDesktop = ref.watch(isDesktopProvider);
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
          child: Card(
            elevation:
                (isDesktop && Theme.of(context).brightness == Brightness.dark)
                    ? 0
                    : elev.toDouble(),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context)
                      .menuButtonTheme
                      .style!
                      .foregroundColor!
                      .resolve({})!,
                ),
                borderRadius:
                    const BorderRadius.all(Radius.circular(cornerSize)),
              ),
              clipBehavior: Clip.antiAlias,
              child: theColumn(context),
            ),
          ),
        );
      });

  Widget theColumn(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              widget.icon,
              size: 23,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      );
}
