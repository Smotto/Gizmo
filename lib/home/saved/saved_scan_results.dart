import 'package:flutter/material.dart';

class SavedScanResults extends StatefulWidget {
  const SavedScanResults({Key? key}) : super(key: key);

  @override
  State<SavedScanResults> createState() => _SavedScanResultsState();
}

class _SavedScanResultsState extends State<SavedScanResults> {
  List<bool> selected = [false, false];

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
          rows: <DataRow>[
            DataRow(
                selected: selected[0],
                onSelectChanged: (bool? value)
                {
                  setState(() {
                    selected[0] = value!;
                  });
                },
                cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true, onTap: () => {
              })
            ]),
            DataRow(
                selected: selected[1],
                onSelectChanged: (bool? value)
                {
                  setState(() {
                    selected[1] = value!;
                  });
                },
                cells: [
              DataCell(Text('0x00000000')),
              DataCell(Text('0')),
              DataCell(Text('9999999999')),
              DataCell(Text('label'), placeholder: true)
            ]),
          ]),
    );
  }
}
