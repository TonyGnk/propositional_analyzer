import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_fields.dart';
import 'segmented.dart';
import 'segmented2.dart';
import 'create_state.dart';

class Create extends ConsumerStatefulWidget {
  const Create({super.key});

  @override
  ConsumerState<Create> createState() => _CreateState();
}

class _CreateState extends ConsumerState<Create> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      createReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: animatedColumn(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const SegmentedControl(),
              inPutField(context, kController, 'Set K variable',
                  Icons.expand_less_outlined),
              inPutField(context, nController, 'Set N variable',
                  Icons.local_parking_outlined),
              inPutField(context, sampleController, 'Set Sample Size',
                  Icons.workspaces_outlined),
              inPutField(context, stopController, 'Set Stop Size',
                  Icons.vertical_align_bottom_outlined),
              const Expanded(flex: 1, child: SizedBox()),
              modeText(context),
              const SizedBox(height: 16),
              rowOfButtons(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

//
}
