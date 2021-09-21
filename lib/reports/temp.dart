import 'package:flutter/material.dart';
import 'package:pier/widgets/gauge.dart';

class Temp extends StatelessWidget {
  final Map state;
  const Temp({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.containsKey('cpu') && state['cpu'] != null) {
      if (state['cpu'].containsKey('temp') && state['cpu']['temp'] != null) {
        final temp = state['cpu']['temp'].toDouble();
        return Gauge(title: 'TEMP', value: temp, minValue: 25, maxValue: 85, unit: '℃');
      }
    }
    return Container();
  }
}
