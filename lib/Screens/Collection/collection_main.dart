import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'collection_state.dart';

class Collection extends ConsumerStatefulWidget {
  const Collection({super.key});

  @override
  ConsumerState<Collection> createState() => CollectionState();
}

class CollectionState extends ConsumerState<Collection> {
  List<Widget> trackList = [];

  Color color1 = Colors.orangeAccent;
  String str = 'M0';
  String str2 = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      collectionReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => animatedColumn(
        (MediaQuery.of(context).size.width > 600)
            ? desktopView()
            : mobileView(),
      );

  desktopView() => SizedBox();
  mobileView() => SizedBox();
}
