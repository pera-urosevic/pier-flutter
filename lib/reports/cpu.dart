import 'package:flutter/material.dart';
import 'package:pier/widgets/gauge.dart';
import 'package:pier/widgets/top.dart';

class Cpu extends StatelessWidget {
  final Map state;
  const Cpu({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.containsKey('cpu') && state['cpu'] != null) {
      if (state['cpu'].containsKey('usage') && state['cpu']['usage'] != null) {
        final usage = state['cpu']['usage'].toDouble();
        Widget? details;
        if (state['cpu'].containsKey('top') && state['cpu']['top'] != null) {
          details = Top(processList: state['cpu']['top']);
        }
        return Gauge(title: 'CPU', value: usage, details: details);
      }
    }
    return Container();
  }
}
