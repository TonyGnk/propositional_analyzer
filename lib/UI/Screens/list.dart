import 'package:flutter/material.dart';
import '../Routed Screen/routed_screen.dart';
import 'About/about_main.dart';

// The home page for the app. This is the first page the user sees.
RoutedScreen aboutScreen() => const RoutedScreen(
      mainChild: AboutScreen(),
      label: 'Πληροφορίες Εφαρμογής',
      labelRoute: 'about',
      icon: Icons.info_outline,
      filledIcon: Icons.info,
    );
