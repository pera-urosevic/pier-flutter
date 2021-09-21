import 'package:flutter/material.dart';
import 'package:pier/widgets/gauge.dart';

class Disk extends StatelessWidget {
  final Map state;
  const Disk({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.containsKey('disk') && state['disk'] != null) {
      if (state['disk'].containsKey('usage') && state['disk']['usage'] != null) {
        final usage = state['disk']['usage'].toDouble();
        return Gauge(title: 'DISK', value: usage);
      }
    }
    return Container();
  }
}
