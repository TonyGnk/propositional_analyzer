import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services/global_variables.dart';

final isHoveredProviderModernButton = StateProvider<bool>((ref) => false);

class InstructionsButton extends StatefulWidget {
  const InstructionsButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<InstructionsButton> createState() => _InstructionsButtonState();
}

class _InstructionsButtonState extends State<InstructionsButton> {
  int gradientIndex = 0;
  late double scale = 1.0;

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
            //color = Colors.grey.withOpacity(0.2);
          });
        },
        onExit: (event) {
          setState(() {
            scale = 1.0;
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
            child: AnimatedContainer(
              margin: const EdgeInsets.fromLTRB(7, 0, 7, 8),
              duration: const Duration(seconds: 1),
              height: 52,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1.5,
                ),
                borderRadius:
                    const BorderRadius.all(Radius.circular(cornerSize + 1)),
              ),
              clipBehavior: Clip.antiAlias,
              child: theColumn(context),
            ),
          ),
        ),
      );

  Widget theColumn(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
            style: const TextStyle(
              fontSize: 17,
              fontFamily: 'Play',
            ),
          ),
        ],
      );
}
