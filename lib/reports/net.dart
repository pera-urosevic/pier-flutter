import 'package:flutter/material.dart';
import 'package:pier/widgets/chart.dart';
import 'package:pier/widgets/gauge.dart';

const double pingMin = 0.0;
const double pingMax = 1000.0;

class Net extends StatelessWidget {
  final Map state;
  const Net({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.containsKey('net') && state['net'] != null && state['net'].length > 0) {
      final last = state['net'][0];
      if (last.containsKey('avg') && last['avg'] != null) {
        final avg = last['avg'].toDouble();
        List<double> data = [];
        for (Map ping in state['net']) {
          data.add(ping['avg']);
        }
        return Gauge(
          title: 'NET',
          value: avg,
          decimals: 0,
          minValue: pingMin,
          maxValue: pingMax,
          unit: 'ms',
          details: Chart(data: data, min: pingMin, max: pingMax),
        );
      }
    }
    return Container();
  }
}
