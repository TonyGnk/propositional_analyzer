import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants.dart';

final trackingProvider = StateProvider<TrackingList>(
  (ref) => TrackingList(),
);

//clear the tracking list
void clearTrackingList(WidgetRef ref) {
  ref.read(trackingProvider.notifier).state.clear();
}

class TrackingList extends StatelessWidget {
  TrackingList({
    super.key,
    this.ref,
    List<TrackingTiles>? trackingTiles,
  }) : trackingTiles = trackingTiles ?? [];

  final WidgetRef? ref;
  final List<TrackingTiles> trackingTiles;

  @override
  ListView build(BuildContext context) => ListView(
        reverse: true,
        children: [
          for (int i = trackingTiles.length - 1; i >= 0; i--)
            trackingTiles[i].build(context),
        ],
      );

  void clear() {
    trackingTiles.clear();
  }

  void addTile(
    int value,
    String operation,
    WidgetRef ref,
  ) {
    trackingTiles.add(
      TrackingTiles(
        value,
        operation,
      ),
    );

    addTrackingContainerRolling(ref);
  }
}

class TrackingTiles {
  TrackingTiles(this.value, this.operation);

  final int value;
  final String operation;

  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(cornerSize)),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        ),
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              child: Text('  $operation'),
            ),
            Container(
              width: 195,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(cornerSize),
                ),
              ),
              child: Center(
                child: Text(
                  getPreviousValue(value, operation) +
                      (operation == 'Initial Value' ? '' : ' 🡢 ') +
                      value.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Play',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class SemiTrack extends StatelessWidget {
  const SemiTrack({
    super.key,
    this.value = 0,
    this.operation = '',
  });

  final int value;
  final String operation;
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          margin: const EdgeInsets.all(2),
          width: 90,
          height: 40,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(cornerSize),
            ),
          ),
          child: Center(
            child: Text(
              getPreviousValue(value, operation) +
                  (operation != 'Initial Value' ? ' 🡢 ' : '') +
                  value.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}

getPreviousValue(int value, String operation) {
  if (operation == 'Increase') {
    return (value - 1).toString();
  } else if (operation == 'Decrease') {
    return (value + 1).toString();
  } else if (operation == 'Double') {
    return (value ~/ 2).toString();
  } else if (operation == 'Half') {
    return (value * 2).toString();
  } else if (operation == 'Square') {
    return sqrt(value).toInt().toString();
  } else if (operation == 'Root') {
    return pow(value, 2).toInt().toString();
  } else if (operation == 'Initial Value') {
    return '';
  } else {
    return 0.toString();
  }
}

final trackUpdater = StateProvider<bool>((ref) => false);

void addTrackingContainerRolling(WidgetRef ref) {
  ref.watch(trackUpdater.notifier).state = !ref.read(trackUpdater);
}
