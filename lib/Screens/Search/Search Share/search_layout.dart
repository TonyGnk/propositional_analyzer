import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'algorithm_bridge.dart';

desktopView(
  BuildContext context,
  bool isDesktop,
  List<TrackContainer> trackList,
  Widget callCircle,
) =>
    Row(
      children: [
        SizedBox(
          width: 280,
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
        Expanded(
          child: Center(child: callCircle),
        ),
      ],
    );

mobileView(
  BuildContext context,
  List<TrackContainer> trackList,
  Widget callCircle,
) =>
    Column(
      children: [
        callCircle,
        const SizedBox(height: 20),
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
