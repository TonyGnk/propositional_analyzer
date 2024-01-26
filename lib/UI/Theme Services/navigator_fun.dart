// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

Future<void> navigateToScreen(BuildContext context, String rootName) async {
  await Future.delayed(const Duration(milliseconds: 200));
  Navigator.pushNamed(context, rootName);
}

Future<void> navigateBack(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 100));
  Navigator.pop(context);
}
