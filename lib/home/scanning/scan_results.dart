import 'package:flutter/material.dart';

class ScanResults extends StatefulWidget {
  const ScanResults({Key? key}) : super(key: key);

  @override
  State<ScanResults> createState() => _ScanResultsState();
}

class _ScanResultsState extends State<ScanResults> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

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
          rows: List<DataRow>.generate(numItems, (int index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    // All rows will have the same selected color.
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                    }
                    // Even rows will have a grey color.
                    if (index.isEven) {
                      return Colors.grey.withOpacity(0.3);
                    }
                    return null; // Use default value for other states and odd rows.
                  }),
              cells: <DataCell>[
                DataCell(Text('$index')),
                DataCell(Text('0')),
                DataCell(Text('9999999999')),
                DataCell(Text('label'), placeholder: true),
              ],
            selected: selected[index],
            onSelectChanged: (bool? value) {
              setState(() {
                selected[index] = value!;
              });
            },),

    ),

      ),
    );
  }
}
