import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<double> data;
  final double min;
  final double max;
  const Chart({Key? key, required this.data, this.min = 0, this.max = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> safeData = data.map((value) {
      if (value < min) return min;
      if (value > max) return max;
      return value;
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 300,
        child: Sparkline(
          data: safeData,
          min: min,
          max: max,
          lineWidth: 2.0,
          lineGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red,
              Colors.green,
            ],
          ),
          gridLineLabelPrecision: 4,
          enableGridLines: true,
        ),
      ),
    );
  }
}
