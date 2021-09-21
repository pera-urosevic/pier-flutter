import 'package:flutter/material.dart';
import 'package:pier/widgets/gauge.dart';

class Swap extends StatelessWidget {
  final Map state;
  const Swap({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.containsKey('mem') && state['mem'] != null) {
      if (state['mem'].containsKey('swap') && state['mem']['swap'] != null) {
        final swap = state['mem']['swap'].toDouble();
        return Gauge(title: 'SWAP', value: swap, monochromatic: true);
      }
    }
    return Container();
  }
}
