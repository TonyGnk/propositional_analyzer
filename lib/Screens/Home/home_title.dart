import 'package:flutter/material.dart';

welcomeToText(BuildContext context) => Text(
      'Welcome to',
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.right,
    );

titleText(BuildContext context) => Text(
      'Propositional\nAnalyzer',
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center,
    );

previousTitleTheme(BuildContext context) => TextStyle(
    fontSize: 34,
    color: Theme.of(context).canvasColor,
    fontWeight: FontWeight.bold);
