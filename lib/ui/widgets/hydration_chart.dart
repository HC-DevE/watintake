// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class HydrationChart extends StatelessWidget {
//   final List<HydrationEntry> hydrationEntries;

//   const HydrationChart({super.key, required this.hydrationEntries});

//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       LineChartData(
//         lineTouchData: LineTouchData(enabled: false),
//         gridData: FlGridData(show: false),
//         titlesData: FlTitlesData(
//           bottomTitles: SideTitles(showTitles: false),
//           leftTitles: SideTitles(
//             showTitles: true,
//             margin: 16,
//             reservedSize: 30,
//             getTextStyles: (value) => Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
//             getTitles: (value) => '${value.toInt()} ml',
//           ),
//         ),
//         borderData: FlBorderData(show: false),
//         lineBarsData: [
//           LineChartBarData(
//             spots: hydrationEntries.map((entry) => FlSpot(entry.time.toDouble(), entry.amount.toDouble())).toList(),
//             isCurved: true,
//             colors: [Theme.of(context).primaryColor],
//             barWidth: 2,
//           ),
//         ],
//       ),
//     );
//   }
// }

// mixin HydrationEntry {
// }

//2nd method

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:watintake/models/hydration_entry.dart';

class HydrationChart extends StatelessWidget {
  final List<HydrationEntry> hydrationEntries;

  const HydrationChart({Key? key, required this.hydrationEntries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(enabled: false),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(showTitles: false),
          leftTitles: SideTitles(
            showTitles: true,
            margin: 16,
            reservedSize: 30,
            getTextStyles: (value) => Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
            getTitles: (value) => '${value.toInt()} ml',
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: hydrationEntries.map((entry) => FlSpot(entry.date.millisecondsSinceEpoch.toDouble(), entry.hydration.amount.toDouble())).toList(),
            isCurved: true,
            colors: [Theme.of(context).primaryColor],
            barWidth: 2,
          ),
        ],
      ),
    );
  }
}

