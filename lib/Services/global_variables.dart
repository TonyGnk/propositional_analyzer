import 'package:fl_chart/fl_chart.dart';

int numberOfTests = 3;
int N = 12;
int K = 6;
int stop = 2;

int timeOut = 30;

int selected = 0;

List<FlSpot> spots1 = [];
List<FlSpot> spots2 = [];

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
