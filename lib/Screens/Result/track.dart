import 'package:flutter/material.dart';

class Track extends StatelessWidget {

  const Track({
    required this.founded, required this.time, required this.isSmall, super.key,
  });
  final bool isSmall;
  final int founded;
  final int time;

  @override
  Widget build(BuildContext context) => isSmall ? smallRow() : bigRow();

  smallRow() => Row(
        children: [
          //icon,
          Expanded(
            child: Container(
              child: Text('founded: $founded'),
            ),
          ),
        ],
      );

  bigRow() => Row(
        children: [
          //icon,
          Expanded(
            child: Container(
              child: Text('founded: $founded'),
            ),
          ),
        ],
      );
}
