import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LineChartSample(),
    );
  }
}

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart Example'),
      ),
      body: Center(
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(16.0),
          child: LineChart(
            LineChartData(
                lineBarsData: [
                  LineChartBarData(
                      spots: const [
                        FlSpot(0, 4),
                        FlSpot(0.5, 4.2),
                        FlSpot(1.5, 4),
                        FlSpot(1.4, 4.5),
                        FlSpot(1.6, 4.7),
                        FlSpot(2, 4.7),
                        FlSpot(2.5, 4.3),
                        FlSpot(3.2, 4.5),
                        FlSpot(3.5, 3.6),
                        FlSpot(5, 3.1),
                        //FlSpot(5.5, 3),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [Colors.blue.withOpacity(.5), Colors.blue.withOpacity(0)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      )
                    //aboveBarData: BarAreaData(show: true),
                  ),
                ],
                //minX: 0,
                maxX: 6,
                //minY: 0,
                maxY: 6,
                titlesData: const FlTitlesData(
                  /*leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false, getTitlesWidget: (value, meta) {
                  return Text(value.toString());
                },)),
                bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),*/
                  show: false,
                ),
                borderData: FlBorderData(show: false, border: Border.all(color: Colors.black)),
                gridData: const FlGridData(show: false),
                extraLinesData: ExtraLinesData(/*verticalLines: [
                  VerticalLine(x: 4, color: Colors.blueGrey, dashArray: [6])
                ], */
                    horizontalLines: [
                      HorizontalLine(y: 4, color: Colors.blue.shade300, dashArray: [6])
                    ])),
            duration: const Duration(microseconds: 800),
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }
}
