import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/constants.dart';

final isHoveredProviderModernButton = StateProvider<bool>((ref) => false);

class AnalyzeButton extends StatefulWidget {
  const AnalyzeButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<AnalyzeButton> createState() => _AnalyzeButtonState();
}

class _AnalyzeButtonState extends State<AnalyzeButton> {
  late Color color = Colors.deepOrangeAccent.withOpacity(0.5);
  late Color color2 = Colors.deepOrangeAccent.withOpacity(0.5);
  late Color borderColor = Colors.deepOrangeAccent.withOpacity(0);
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
            scale = 0.97;
          });
        },
        onExit: (event) {
          setState(() {
            scale = 1.0;
          });
        },
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            setState(() {
              color = Colors.grey.withOpacity(0.1);
              color2 = Colors.deepOrangeAccent.withOpacity(0.4);
              borderColor =
                  Colors.deepOrangeAccent.withOpacity(1).withOpacity(0.4);
            });
            //wait 30 seconds
            await Future.delayed(const Duration(seconds: 3));
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
                //color: color,
                gradient: LinearGradient(
                  colors: [
                    color2,
                    color,
                  ],
                  begin: alignmentGeometryA,
                  end: alignmentGeometryB,
                ),
                border: Border.all(
                  color: borderColor,
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
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 19,
              fontFamily: 'Play',
            ),
          ),
        ],
      );
}
