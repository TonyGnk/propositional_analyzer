import 'package:audioplayers/audioplayers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int numberOfTests = 1;
int N = 7;
int K = 6;
int M = 1;
int stop = 1;

int timeOut = 2;

int selected = 0;
bool selectedHill = true;
bool selectedDepth = false;
bool selectedDPLL = false;
bool selectedWalk = true;

List<FlSpot> spots1 = [];
List<FlSpot> spots2 = [];

List<FlSpot> spotsHill = [];
List<FlSpot> spotsDepth = [];
List<FlSpot> spotsDPLL = [];
List<FlSpot> spotsWalk = [];

final player = AudioPlayer();

const double cornerSize = 16;

const Duration basicDuration = Duration(milliseconds: 200);
Duration basicDuration1 = Duration(
  milliseconds: basicDuration.inMilliseconds + 100,
);
Duration basicDuration2 = Duration(
  milliseconds: basicDuration.inMilliseconds + 200,
);
Duration basicDuration3 = Duration(
  milliseconds: basicDuration.inMilliseconds + 300,
);
Duration basicDuration4 = Duration(
  milliseconds: basicDuration.inMilliseconds + 400,
);
Duration basicDuration5 = Duration(
  milliseconds: basicDuration.inMilliseconds + 500,
);

final isDesktopProvider = StateProvider<bool>((ref) => true);
