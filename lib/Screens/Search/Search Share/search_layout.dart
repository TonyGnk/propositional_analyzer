import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'algorithm_bridge.dart';
import 'track.dart';

desktopView(
  BuildContext context,
  bool isDesktop,
  List<Widget> trackList,
  String M,
  String T,
  Widget child,
) =>
    Consumer(
      builder: (context, ref, _) {
        final controller = ref.watch(controllerProvider);
        return Row(
          children: [
            SizedBox(
              width: 330,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        M,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        T,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: trackListContainer(
                      context,
                      ListView.builder(
                        controller: controller,
                        dragStartBehavior: DragStartBehavior.down,
                        itemBuilder: (context, index) => trackList[index],
                        itemCount: trackList.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(child: child),
            ),
          ],
        );
      },
    );

mobileView(
  BuildContext context,
  List<Widget> trackList,
  String M,
  String T,
  Widget child,
) =>
    Consumer(
      builder: (context, ref, _) {
        final controller = ref.watch(controllerProvider);
        return Column(
          children: [
            Expanded(
              child: child,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  M,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  T,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: trackListContainer(
                context,
                ListView.builder(
                  controller: controller,
                  dragStartBehavior: DragStartBehavior.down,
                  itemBuilder: (context, index) => trackList[index],
                  itemCount: trackList.length,
                ),
              ),
            ),
          ],
        );
      },
    );
