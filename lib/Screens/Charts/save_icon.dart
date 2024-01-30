import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsaver/jSaver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../constants.dart';
import '../screen_list.dart';

saveIcon() => IconButton(
      tooltip: 'Save Analysis',
      selectedIcon: const Icon(Icons.save),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
      ),
      onPressed: () => saveAnalysis(),
      icon: const Icon(Icons.save),
      highlightColor: Colors.grey.withOpacity(0.2),
    );

final _jSaverPlugin = JSaver.instance;

saveAnalysis() async {
  String stringFile = '';
  //For all the spots create a String
  for (int i = 0; i < spots1.length; i++) {
    stringFile += '${spots1[i].x},${spots1[i].y},${spots2[i].y}\n';
  }

  //Create a Uint8List from the String
  Uint8List data = Uint8List.fromList(stringFile.codeUnits);

  final v = await _jSaverPlugin.saveFromData(data: data, name: 'analysis.txt');
}

loadAnalysis() async {
  print('Load Analysis');

  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (UniversalPlatform.isWindows) {
    if (result != null && result.files.isNotEmpty) {
      File file = File(result.files.single.path!);
      String stringFile = file.readAsStringSync();
      print(stringFile);
      spots1.clear();
      spots2.clear();
      List<String> lines = stringFile.split('\n');
      //in Lines without the last
      for (String line in lines.sublist(0, lines.length - 1)) {
        List<String> values = line.split(',');
        spots1.add(FlSpot(double.parse(values[0]), double.parse(values[1])));
        spots2.add(FlSpot(double.parse(values[0]), double.parse(values[2])));
      }
      return true;
    } else {
      // User canceled the picker
    }
  } else {
    if (result != null && result.files.isNotEmpty) {
      final bytes = result.files.first.bytes;
      if (bytes != null) {
        String stringFile = utf8.decode(bytes);
        spots1.clear();
        spots2.clear();
        for (String line in stringFile.split('\n')) {
          List<String> values = line.split(',');
          spots1.add(FlSpot(double.parse(values[0]), double.parse(values[1])));
          spots2.add(FlSpot(double.parse(values[0]), double.parse(values[2])));
          return true;
        }
      }
    }
  }
}
