import 'package:flutter/material.dart';

Widget bodyWithAppBarGlass({
  required Widget appBar,
  required Widget body,
}) =>
    Stack(
      children: [
        const BackgroundWall(),
        Column(
          children: [
            appBar,
            Expanded(child: body),
          ],
        ),
      ],
    );

class BackgroundWall extends StatelessWidget {
  const BackgroundWall({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(child: scaffoldGradient(context)),
        ],
      );

  scaffoldGradient(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).splashColor,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              stops: const [
                0.01,
                0.6,
              ]),
        ),
      );
}
