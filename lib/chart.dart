import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    //AppColors.contentColorCyan in rgb is 46, 196, 182
    const Color.fromRGBO(199, 109, 35, 1),
    //AppColors.contentColorBlue, in rgb is 0, 172, 193
    const Color.fromRGBO(167, 123, 3, 1),
  ];

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(14),
        child: LineChart(
          mainData(),
        ),
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
      case 5:
        text = const Text('JUN', style: style);
      case 8:
        text = const Text('SEP', style: style);
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
      case 3:
        text = '30k';
      case 5:
        text = '50k';
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() => LineChartData(
        lineTouchData: LineTouchData(
          getTouchedSpotIndicator: (
            LineChartBarData barData,
            List<int> spotIndexes,
          ) =>
              spotIndexes.map((spotIndex) {
            final spot = barData.spots[spotIndex];
            if (spot.x == 0 || spot.x == 6) {
              return null;
            }
            return TouchedSpotIndicatorData(
              const FlLine(
                color: Colors.red,
                strokeWidth: 4,
              ),
              FlDotData(
                getDotPainter: (spot, percent, barData, index) {
                  if (index.isEven) {
                    return FlDotCirclePainter(
                      radius: 8,
                      color: Colors.white,
                      strokeWidth: 5,
                      strokeColor: Colors.blue,
                    );
                  } else {
                    return FlDotSquarePainter(
                      size: 16,
                      color: Colors.white,
                      strokeWidth: 5,
                      strokeColor: Colors.blue,
                    );
                  }
                },
              ),
            );
          }).toList(),
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.green,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) =>
                touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              if (flSpot.x == 0 || flSpot.x == 6) {
                return null;
              }

              TextAlign textAlign;
              switch (flSpot.x.toInt()) {
                case 1:
                  textAlign = TextAlign.left;
                case 5:
                  textAlign = TextAlign.right;
                default:
                  textAlign = TextAlign.center;
              }

              return LineTooltipItem(
                'widget[flSpot.x.toInt()] \n',
                const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: flSpot.y.toString(),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const TextSpan(
                    text: ' k ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const TextSpan(
                    text: 'calories',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
                textAlign: textAlign,
              );
            }).toList(),
          ),
          touchCallback: (FlTouchEvent event, LineTouchResponse? lineTouch) {
            if (!event.isInterestedForInteractions ||
                lineTouch == null ||
                lineTouch.lineBarSpots == null) {
              setState(() {
                //touchedValue = -1;
              });
              return;
            }
            final value = lineTouch.lineBarSpots![0].x;

            if (value == 0 || value == 6) {
              setState(() {
                //touchedValue = -1;
              });
              return;
            }

            setState(() {
              //touchedValue = value;
            });
          },
        ),
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: 1.8,
              color: Colors.green,
              strokeWidth: 3,
              dashArray: [20, 10],
            ),
          ],
        ),
        gridData: FlGridData(
          show: false,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) => const FlLine(
            color: Color.fromRGBO(46, 196, 182, 1),
            strokeWidth: 1,
          ),
          getDrawingVerticalLine: (value) => const FlLine(
            color: Color.fromRGBO(0, 172, 193, 1),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d)),
        ),
        minY: 0,
        maxY: 1.1,
        lineBarsData: [
          LineChartBarData(
            spots: spots1,
            isCurved: false,
            gradient: LinearGradient(
              colors: gradientColors,
            ),
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ),
        ],
      );
}
