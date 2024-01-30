import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Charts/save_icon.dart';
import 'hom_title.dart';
import 'home_buttons.dart';
import 'home_state.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      homeReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 27),
        child: animatedColumn(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              welcomeToText,
              titleText(context),
              const Expanded(child: SizedBox()),
              newCreateButton,
              const SizedBox(height: 6),
              newLoadButton,
              const Expanded(flex: 1, child: SizedBox()),
              const SizedBox(height: 10),
              // TextButton(
              //     child: Text('Start'),
              //     onPressed: () async {
              //       int M = 599;
              //       List<List<int>> problem =
              //           List.generate(M, (i) => List.filled(K, 0));
              //       problem = newProblem(problem);
              //       depthFirst(problem, M);
              //     })
            ],
          ),
        ),
      );

//
}
