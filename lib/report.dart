import 'package:flutter/material.dart';
import 'package:pier/reports/disk.dart';
import 'package:pier/reports/cpu.dart';
import 'package:pier/reports/net.dart';
import 'package:pier/reports/uptime.dart';
import 'package:pier/reports/ram.dart';
import 'package:pier/reports/swap.dart';
import 'package:pier/reports/temp.dart';

class Report extends StatelessWidget {
  final Map state;
  const Report({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          runSpacing: 20,
          spacing: 20,
          children: [
            Uptime(state: state),
            Ram(state: state),
            Swap(state: state),
            Cpu(state: state),
            Temp(state: state),
            Disk(state: state),
            Net(state: state),
          ],
        ),
      ),
    );
  }
}
