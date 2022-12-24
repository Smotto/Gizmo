import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import '/home/blocs/blocs.dart';

class ScanView extends StatefulWidget
{
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanBloc, ScanState>(
      builder: (context, state) {
        return Expanded(
          child: Row(
            children: [
              Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      columns: const <DataColumn>[
                        DataColumn(label: Text("Address")),
                        DataColumn(label: Text("Value"), numeric: true),
                        DataColumn(
                            label: Text("Previous Value"), numeric: true),
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
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () => {},
                              color: Colors.green,
                              icon: const Icon(Icons.play_arrow)),
                          suffixIcon: IconButton(
                            color: Colors.lightBlueAccent,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              print("Cancel icon activated.");
                            },
                          ),
                          label: const Text("Manual Scan"),
                          border: const OutlineInputBorder(),
                          hintText: 'Enter value',
                        ),
                        onSubmitted: (String? value) {
                          context
                              .read<ScanBloc>()
                              .add(ManualScanEvent(value!));
                        },
                      ),
                    ),
                    DropdownButton<String>(
                      value: context.read<ScanBloc>().selectedDataType,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // Called when use selects data type.
                        context
                            .read<ScanBloc>()
                            .add(SelectDataTypeEvent(value!));
                      },
                      items: dataTypes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              BlocBuilder<HexBloc, HexState>(builder: (context, state) {
                return Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: StickyHeadersTable(
                        initialScrollOffsetX: _scrollOffsetX,
                        initialScrollOffsetY: _scrollOffsetY,
                        onEndScrolling: (scrollOffsetX, scrollOffsetY) {
                          _scrollOffsetX = scrollOffsetX;
                          _scrollOffsetY = scrollOffsetY;
                        },
                        columnsLength: titleColumn.length,
                        rowsLength: titleRow.length,
                        columnsTitleBuilder: (i) => Text(titleColumn[i]),
                        rowsTitleBuilder: (i) => Text(titleRow[i]),
                        contentCellBuilder: (i, j) => Text(data[i][j]),
                      ),
                    ));
              })
            ],
          ),
        );
      },
    );
  }
}

var dataTypes = ["Integer", "Float", "Double", "String", "Byte", "Short"];

// ** Temporary variables for testing ** //
double _scrollOffsetX = 0.0;
double _scrollOffsetY = 0.0;
var titleColumn = ["col 0", "col 1", "col 2"];
var titleRow = ["row 0"];
var data = [
  ["0"],
  ["1"],
  ["2"],
  ["3"],
  ["4"],
  ["5"],
  ["6"],
  ["7"],
  ["8"],
  ["9"],
  ["1"],
  ["2"],
  ["3"],
  ["1"],
  ["2"],
  ["3"]
];

