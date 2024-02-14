import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';

class MyFilledButton extends StatefulWidget {
  const MyFilledButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<MyFilledButton> createState() => _MyFilledButtonState();
}

class _MyFilledButtonState extends State<MyFilledButton> {
  double scale = 1.0;
  int elev = 4;

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
          onTap: () async {
            widget.onTap();
          },
          child: AnimatedScale(
            scale: scale,
            duration: basicDuration,
            child: container(),
          ),
        ),
      );

  container() => Consumer(builder: (context, ref, _) {
        final isDesktop = ref.watch(isDesktopProvider);
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
          child: Card(
            elevation:
                (isDesktop && Theme.of(context).brightness == Brightness.dark)
                    ? 0
                    : elev.toDouble(),
            child: AnimatedContainer(
              width: 120,
              duration: const Duration(seconds: 1),
              height: 52,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                borderRadius:
                    const BorderRadius.all(Radius.circular(cornerSize)),
              ),
              clipBehavior: Clip.antiAlias,
              child: theRow(context),
            ),
          ),
        );
      });

  Widget theRow(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              widget.icon,
              size: 23,
              color: Theme.of(context).textTheme.headlineLarge!.color,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.label,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      );
}
