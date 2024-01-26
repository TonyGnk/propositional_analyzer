import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/constants.dart';

final isHoveredProviderModernButton = StateProvider<bool>((ref) => false);

class ModeButtons extends StatefulWidget {
  const ModeButtons({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<ModeButtons> createState() => _ModeButtonsState();
}

class _ModeButtonsState extends State<ModeButtons> {
  late Color color = Colors.grey.withOpacity(0.1);
  late Color borderColor = Colors.white.withOpacity(0.2);
  late Timer timer;
  late AlignmentGeometry alignmentGeometryA =
      alignmentGeometryList[gradientIndex];
  late AlignmentGeometry alignmentGeometryB =
      alignmentGeometryList2[gradientIndex];
  late List<AlignmentGeometry> alignmentGeometryList = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerRight,
    Alignment.bottomRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.centerLeft,
  ];
  late List<AlignmentGeometry> alignmentGeometryList2 = [
    Alignment.bottomRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.centerLeft,
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerRight,
  ];
  int gradientIndex = 0;
  late double scale = 1.0;

  @override
  void initState() {
    super.initState();
    _updateGradientType();
    timer = Timer.periodic(const Duration(milliseconds: 1100), (Timer t) {
      _updateGradientType();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _updateGradientType() {
    setState(() {
      gradientIndex = (gradientIndex + 1) % alignmentGeometryList.length;
      alignmentGeometryA = alignmentGeometryList[gradientIndex];
      alignmentGeometryB = alignmentGeometryList2[gradientIndex];
    });
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (event) {
          setState(() {
            scale = 0.93;
            //color = Colors.grey.withOpacity(0.2);
            color = const Color.fromARGB(255, 33, 117, 243).withOpacity(0.4);
            borderColor =
                const Color.fromARGB(255, 33, 117, 243).withOpacity(0.3);
          });
        },
        onExit: (event) {
          setState(() {
            scale = 1.0;
            color = Colors.grey.withOpacity(0.1);
            borderColor = Colors.white.withOpacity(0.2);
          });
        },
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {
              color = Colors.grey.withOpacity(0.1);
              borderColor = Colors.white.withOpacity(0.2);
            });
            widget.onTap();
          },
          child: AnimatedScale(
            scale: scale,
            duration: basicDuration,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 80,
              decoration: BoxDecoration(
                //color: color,
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.withOpacity(0.1),
                    color,
                  ],
                  begin: alignmentGeometryA,
                  end: alignmentGeometryB,
                ),
                border: Border.all(
                  color: borderColor,
                  width: 2.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
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
          Icon(
            widget.icon,
            size: 27,
          ),
          const SizedBox(width: 8),
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 21,
              fontFamily: 'Play',
            ),
          ),
        ],
      );
}
