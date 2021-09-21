import 'package:flutter/material.dart';

class Gauge extends StatelessWidget {
  final String title;
  final double value;
  final int decimals;
  final double minValue;
  final double maxValue;
  final String unit;
  final bool monochromatic;
  final Widget? details;
  const Gauge({
    Key? key,
    required this.title,
    required this.value,
    this.details,
    this.decimals = 2,
    this.minValue = 0,
    this.maxValue = 100,
    this.unit = '%',
    this.monochromatic = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percent = (value - minValue) / (maxValue - minValue);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Stack(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                value: percent,
                strokeWidth: 12,
                color: Color.lerp(monochromatic ? Colors.grey.shade700 : Colors.green.shade500, monochromatic ? Colors.grey.shade700 : Colors.red.shade500, percent),
                backgroundColor: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              width: 120,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, textScaleFactor: 1.1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' ${value.toStringAsFixed(decimals)}', textScaleFactor: 1.8),
                      Text(unit, textScaleFactor: 1.2),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (details != null) {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(child: details);
            },
          );
        }
      },
    );
  }
}
