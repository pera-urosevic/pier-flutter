import 'package:flutter/material.dart';

class Uptime extends StatelessWidget {
  final Map state;
  const Uptime({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (state.containsKey('uptime') && state['uptime'] != null) {
      widgets.add(const Text(
        'Uptime',
        textScaleFactor: 1.6,
      ));
      if (state['uptime'].containsKey('days') && state['uptime']['days'] != null) {
        final days = state['uptime']['days'];
        widgets.add(Text(' $days', textScaleFactor: 2.4));
        widgets.add(const Text(' days', textScaleFactor: 1.2));
      }
      if (state['uptime'].containsKey('hours') && state['uptime']['hours'] != null) {
        final hours = state['uptime']['hours'];
        widgets.add(Text(' $hours', textScaleFactor: 2.4));
        widgets.add(const Text(' hours', textScaleFactor: 1.2));
      }
    }
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...widgets,
          ],
        ));
  }
}
