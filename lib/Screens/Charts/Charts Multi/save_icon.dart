import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jsaver/jSaver.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../../global_variables.dart';

saveIcon(Future<void> Function() onPressed) => IconButton(
      //tooltip: 'Save Analysis',
      onPressed: onPressed,
      icon: const Icon(Icons.save),
    );

final _jSaverPlugin = JSaver.instance;

Future<void> saveAnalysisSingle() async {
  String stringFile = '';
  //For all the spots create a String
  for (int i = 0; i < spots1.length; i++) {
    stringFile += '${spots1[i].x},${spots1[i].y},${spots2[i].y}\n';
  }

  //Create a Uint8List from the String
  Uint8List data = Uint8List.fromList(stringFile.codeUnits);

  await Future.delayed(const Duration(milliseconds: 200));
  await _jSaverPlugin.saveFromData(data: data, name: 'analysis.txt');
}

Future<void> saveAnalysisMulti() async {
  String stringFile = '';
  //For all the spots create a String
  for (int i = 0; i < spots1.length; i++) {
    stringFile +=
        '${spots1[i].x},${spots1[i].y},${spots2Hill[i].y},${spots2Depth[i].y},${spots2DPLL[i].y},${spots2Walk[i].y}\n';
  }

  //Create a Uint8List from the String
  Uint8List data = Uint8List.fromList(stringFile.codeUnits);

  await Future.delayed(const Duration(milliseconds: 200));
  await _jSaverPlugin.saveFromData(data: data, name: 'analysis.txt');
}

loadAnalysis() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (UniversalPlatform.isWindows) {
    if (result != null && result.files.isNotEmpty) {
      File file = File(result.files.single.path!);
      String stringFile = file.readAsStringSync();
      return readAnalysis(stringFile);
    }
  } else {
    if (result != null && result.files.isNotEmpty) {
      final bytes = result.files.first.bytes;
      if (bytes != null) {
        String stringFile = utf8.decode(bytes);
        return readAnalysis(stringFile);
      }
    }
  }
}

bool readAnalysis(String stringFile) {
  List<String> lines = stringFile.split('\n');
  bool isSingle = lines[0].split(',').length < 4;

  if (isSingle) {
    print('Single Load');
    spots1.clear();
    spots2.clear();

    for (String line in lines.sublist(0, lines.length - 1)) {
      List<String> values = line.split(',');
      spots1.add(FlSpot(double.parse(values[0]), double.parse(values[1])));
      spots2.add(FlSpot(double.parse(values[0]), double.parse(values[2])));
    }
  } else {
    print('Multi Load');
    spots1.clear();
    spots2Hill.clear();
    spots2Depth.clear();
    spots2DPLL.clear();
    spots2Walk.clear();

    for (String line in lines.sublist(0, lines.length - 1)) {
      List<String> values = line.split(',');
      spots1.add(FlSpot(double.parse(values[0]), double.parse(values[1])));
      spots2Hill.add(FlSpot(double.parse(values[0]), double.parse(values[2])));
      spots2Depth.add(FlSpot(double.parse(values[0]), double.parse(values[3])));
      spots2DPLL.add(FlSpot(double.parse(values[0]), double.parse(values[4])));
      spots2Walk.add(FlSpot(double.parse(values[0]), double.parse(values[5])));
    }
  }

  //Find max y of spots1 and store it to numberOfTests
  for (FlSpot spot in spots1) {
    if (spot.y > numberOfTests) {
      numberOfTests = spot.y.toInt();
    }
  }

  return isSingle;
}
