import 'package:flutter/material.dart';

const welcomeToText = Text(
  'Welcome to',
  style: TextStyle(
    fontSize: 27,
    fontFamily: 'Play',
  ),
  textAlign: TextAlign.right,
);

titleText(BuildContext context) => Text(
      'Propositional Analyzer',
      style: TextStyle(
          fontSize: 34,
          color: Theme.of(context).canvasColor,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
