import 'package:flutter/material.dart';

const cellPadding = EdgeInsets.symmetric(horizontal: 10);

class Top extends StatelessWidget {
  final List processList;
  const Top({Key? key, required this.processList}) : super(key: key);

  buildRow(Map process) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: cellPadding,
            child: Text(process['pid'].toString(), textAlign: TextAlign.right),
          ),
        ),
        TableCell(
          child: Padding(
            padding: cellPadding,
            child: Text('${process['cpu'].toStringAsFixed(2)}%', textAlign: TextAlign.right),
          ),
        ),
        TableCell(
          child: Padding(
            padding: cellPadding,
            child: Text('${process['mem'].toStringAsFixed(2)}%', textAlign: TextAlign.right),
          ),
        ),
        TableCell(
          child: Padding(
            padding: cellPadding,
            child: Text(
              process['cmd'],
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  buildRows() {
    List<TableRow> rows = [];
    for (Map process in processList) {
      rows.add(buildRow(process));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final rows = buildRows();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
          2: IntrinsicColumnWidth(),
          3: FlexColumnWidth(),
        },
        children: [
          const TableRow(
            children: [
              TableCell(child: Padding(padding: cellPadding, child: Text('PID', textAlign: TextAlign.right))),
              TableCell(child: Padding(padding: cellPadding, child: Text('CPU', textAlign: TextAlign.right))),
              TableCell(child: Padding(padding: cellPadding, child: Text('MEM', textAlign: TextAlign.right))),
              TableCell(child: Padding(padding: cellPadding, child: Text('CMD', textAlign: TextAlign.left))),
            ],
          ),
          ...rows,
        ],
      ),
    );
  }
}
