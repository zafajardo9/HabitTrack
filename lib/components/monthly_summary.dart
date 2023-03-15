import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_tracker/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(19, 70, 0, 0),
          2: Color.fromARGB(255, 99, 0, 0),
          3: Color.fromARGB(255, 131, 0, 0),
          4: Color.fromARGB(255, 188, 0, 0),
          5: Color.fromARGB(255, 220, 0, 0),
          6: Color.fromARGB(206, 205, 7, 7),
          7: Color.fromARGB(255, 255, 0, 0),
          8: Color.fromARGB(255, 255, 6, 6),
          9: Color.fromARGB(255, 255, 22, 22),
          10: Color.fromARGB(255, 255, 92, 92),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
