// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'algorithm_bridge.dart';
import 'search_single_desktop.dart';

class SearchSingle extends ConsumerStatefulWidget {
  const SearchSingle({super.key});

  @override
  ConsumerState<SearchSingle> createState() => SearchSingleState();
}

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
