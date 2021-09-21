import 'package:flutter/material.dart';
import 'package:pier/widgets/gauge.dart';
import 'package:pier/widgets/top.dart';

class Ram extends StatelessWidget {
  final Map state;
  const Ram({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.containsKey('mem') && state['mem'] != null) {
      if (state['mem'].containsKey('usage') && state['mem']['usage'] != null) {
        final usage = state['mem']['usage'].toDouble();
        Widget? details;
        if (state['mem'].containsKey('top') && state['mem']['top'] != null) {
          details = Top(processList: state['mem']['top']);
        }
        return Gauge(title: 'RAM', value: usage, details: details);
      }
    }
    return Container();
  }
}
