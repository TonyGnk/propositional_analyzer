import 'package:flutter/material.dart';

Widget trackingWelcome() => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          bigText('Get Started'),
          const SizedBox(height: 12),
          text('Set a start and end value to begin!'),
        ],
      ),
    );

text(String text) => Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, fontFamily: 'Play'),
    );

bigText(String text) => Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 26, fontFamily: 'Play'),
    );
