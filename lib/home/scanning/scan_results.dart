import 'package:flutter/material.dart';

class ScanResults extends StatefulWidget {
  const ScanResults({Key? key}) : super(key: key);

  @override
  State<ScanResults> createState() => _ScanResultsState();
}

class _ScanResultsState extends State<ScanResults> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
          columnSpacing: 15,
          sortColumnIndex: 0,
          sortAscending: true,
          columns: const <DataColumn>[
            DataColumn(label: Text("Address")),
            DataColumn(label: Text("Value"), numeric: true),
            DataColumn(label: Text("Previous Value"), numeric: true),
            DataColumn(label: Text("Label")),
          ],
          rows: const <DataRow>[
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
            DataRow(cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
          ]),
    );
  }
}
