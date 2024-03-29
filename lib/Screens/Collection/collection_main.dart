import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Saved Files/depth_problem.dart';
import '../../Saved Files/dpll_problem.dart';
import '../../Saved Files/hill_problem.dart';
import '../../Saved Files/multi_problem.dart';
import '../../Saved Files/walk_sat_problem.dart';
import '../Charts/Charts Multi/save_icon.dart';
import '../screen_list.dart';
import 'collection_state.dart';

class Collection extends ConsumerStatefulWidget {
  const Collection({super.key});

  @override
  ConsumerState<Collection> createState() => CollectionState();
}

class CollectionState extends ConsumerState<Collection> {
  List<SavedAnalysis> filesLoaded = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      collectionReturn(ref);
    });
    loadFiles();
  }

  //Print the count of txt files from 'collection/' folder
  void loadFiles() {
    filesLoaded.add(
      SavedAnalysis(
        hillProblem1,
        'Hill Climbing Problem 1',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        hillProblem2,
        'Hill Climbing Problem 2',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        depthProblem1,
        'Depth Problem 1',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        depthProblem2,
        'Depth Problem 2',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        dpllProblem1,
        'DPLL Problem 1',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        dpllProblem2,
        'DPLL Problem 2',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        walkSatProblem1,
        'WalkSat Problem 1',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        walkSatProblem2,
        'WalkSat Problem 2',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        allProblem1,
        'The biggest comparison',
      ),
    );
    filesLoaded.add(
      SavedAnalysis(
        allProblemDepthDpll,
        'Depth-First VS DPLL',
      ),
    );
  }

  nameFormatter(String name) {
    String newName = name.substring(0, name.length - 4);

    if (newName.length > 29) {
      newName = '${newName.substring(0, 29)}...';
    }

    return newName;
  }

  @override
  Widget build(BuildContext context) => animatedColumn(
        (MediaQuery.of(context).size.width > 700)
            ? desktopView()
            : mobileView(),
      );

  desktopView() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: filesLoaded.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: containerAnalysis(filesLoaded[index]),
                ),
              ),
            ),
          ]),
        ),
      );

  mobileView() => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: filesLoaded.length,
                itemBuilder: (BuildContext context, int index) =>
                    containerAnalysis(filesLoaded[index]),
              ),
            ),
          ],
        ),
      );

  Widget containerAnalysis(SavedAnalysis file) => SizedBox(
        height: 96,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context)
                    .menuButtonTheme
                    .style!
                    .foregroundColor!
                    .resolve({})!,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' ${file.getName()} '),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                'K=${file.getK()}   N=${file.getN()}   ${file.getTests()} Tests',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                          const SizedBox(width: 10),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                file.getType(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {
                      file.play(ref);
                    },
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    splashColor: Theme.of(context)
                        .navigationDrawerTheme
                        .backgroundColor!
                        .withOpacity(0.3),
                    highlightColor: Theme.of(context)
                        .navigationDrawerTheme
                        .backgroundColor!
                        .withOpacity(0.2),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        const Size(50, 50),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class SavedAnalysis {
  SavedAnalysis(this.stringFile, this.name);

  final String stringFile;
  final String name;

  String getK() {
    final lines = stringFile.split('\n');
    return lines[0].split(',')[0];
  }

  String getN() {
    final lines = stringFile.split('\n');
    return lines[0].split(',')[1];
  }

  String getTests() {
    final lines = stringFile.split('\n');
    return lines[0].split(',')[2];
  }

  String getType() {
    final lines = stringFile.split('\n');
    int numberType = int.parse(lines[0].split(',')[4]);
    return typeMap[numberType]!;
  }

  String getName() => name;

  play(WidgetRef ref) async {
    bool type = readAnalysis(stringFile);
    await Future.delayed(const Duration(milliseconds: 100));
    if (type) {
      goTo(ref, ScreenDestination.chartSingle);
    } else {
      goTo(ref, ScreenDestination.chartMulti);
    }
  }
}

const Map<int, String> typeMap = {
  1: 'Hill',
  2: 'Depth',
  3: 'DPLL',
  4: 'Walk',
  12: 'Hill & Depth',
  13: 'Hill & DPLL',
  14: 'Hill & Walk',
  23: 'Depth & DPLL',
  24: 'Depth & Walk',
  34: 'DPLL & Walk',
  123: 'Not Walk',
  124: 'Not DPLL',
  134: 'Not Depth',
  234: 'Not Hill',
  1234: 'All',
};
