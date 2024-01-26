import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Basic'),
        ),
        body: const Center(
          child: Text('Basic'),
        ),
      );
}
