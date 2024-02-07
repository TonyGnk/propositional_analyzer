import 'package:flutter/material.dart';

circle(
  BuildContext context,
  String str,
  String str2,
  double stop1,
  double stop2, [
  bool isDesktop = false,
]) =>
    Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: 4.7124,
          child: Container(
            width: isDesktop ? 335 : 215,
            height: isDesktop ? 335 : 215,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Colors.orangeAccent,
                  Theme.of(context).unselectedWidgetColor,
                ],
                stops: [stop1, stop2],
              ),
            ),
          ),
        ),
        Container(
          width: isDesktop ? 320 : 200,
          height: isDesktop ? 320 : 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).unselectedWidgetColor,
            //border color
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                str,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Play',
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                str2,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Play',
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ],
    );
