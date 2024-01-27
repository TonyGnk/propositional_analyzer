import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'result_state.dart';
import 'track.dart';
import '../../chart.dart';


class Result extends ConsumerStatefulWidget {
  const Result({super.key});

  @override
  ConsumerState<Result> createState() => _ResultState();
}

class _ResultState extends ConsumerState<Result> {
  Color _containerColor = Colors.blue; // Initial color

  List<Track> tracks = [];

  @override
  void initState() {
    super.initState();
    _startColorChange();
    Future.delayed(Duration.zero, () {
      resultReturn(ref);
    });

    function();
  }

  void _startColorChange() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _containerColor = _generateRandomColor();
        tracks.add(const Track(
          founded: 1,
          time: 1,
          isSmall: true,
        ));
      });
    });
  }

  Color _generateRandomColor() => Color.fromRGBO(
      // Randomly generate RGB values
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1,
    );

  Future function() async {
    //Every 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Track track = const Track(
        founded: 1,
        time: 1,
        isSmall: true,
      );
      setState(() {
        tracks.add(track);
      });
    });
  }

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, WidgetRef ref, __) {
          // ignore: unused_local_variable
          return const Chart();

          // animatedColumn(
          //   Container(
          //     decoration: BoxDecoration(
          //       color: _containerColor,
          //       //Theme.of(context).secondaryHeaderColor,
          //       borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(30),
          //         topRight: Radius.circular(30),
          //       ),
          //     ),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: ListView(
          //             children: tracks,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      );
}



// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Text> wordList = [];

//   @override
//   void initState() {
//     super.initState();
//     startAddingWords();
//   }

//   void startAddingWords() {
//     const interval = Duration(seconds: 5); // Change the interval as needed
//     Timer.periodic(interval, (Timer timer) {
//       addWordToList();
//     });
//   }

//   void addWordToList() {
//     setState(() {
//       wordList.add(Text('New Word'));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Word List App'),
//       ),
//       body: ListView(
//         children: wordList,
//       ),
//     );
//   }
// }
