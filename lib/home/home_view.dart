import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmo/home/blocs/hex_bloc/hex_bloc.dart';
import 'package:gizmo/models/process.dart';
import '../theme/cubit/theme_cubit.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';
import 'blocs/blocs.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const LeftDrawer(),
      backgroundColor: Colors.blueGrey,
      body: Row(
        children: const [
          LeftSide(),
          RightSide(),
        ],
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      width: 70,
      child: Column(
        children: [
          WindowTitleBarBox(
            child: MoveWindow(),
          ),
          BlocBuilder<ProcessBloc, ProcessState>(
            builder: (context, state) {
              return IconButton(
                  icon: Icon(Icons.electrical_services_sharp,
                      color: context.read<ProcessBloc>().plugIconColor),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  });
            },
          ),
          BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              return IconButton(
                  icon: const Icon(Icons.folder, color: Colors.lightBlueAccent),
                  onPressed: () {});
            },
          ),
        ],
      ),
    );
  }
}

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: Container(
        color: Colors.blueAccent,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: MoveWindow(),
            ),
            BlocBuilder<ProcessBloc, ProcessState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView(children: [
                    Card(
                      child: ListTile(
                        selected:
                            context.read<ProcessBloc>().processes[0].isActive,
                        selectedColor: Colors.white,
                        selectedTileColor: Colors.blueGrey,
                        leading: const FlutterLogo(),
                        title:
                            Text(context.read<ProcessBloc>().processes[0].name),
                        onTap: () => {
                          context.read<ProcessBloc>().add(SelectProcessEvent(
                              context.read<ProcessBloc>().processes[0])),
                          Navigator.pop(context),
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        selected:
                            context.read<ProcessBloc>().processes[1].isActive,
                        selectedColor: Colors.white,
                        selectedTileColor: Colors.blueGrey,
                        leading: const FlutterLogo(),
                        title:
                            Text(context.read<ProcessBloc>().processes[1].name),
                        onTap: () => {
                          context.read<ProcessBloc>().add(SelectProcessEvent(
                              context.read<ProcessBloc>().processes[1])),
                          Navigator.pop(context),
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        selected:
                            context.read<ProcessBloc>().processes[2].isActive,
                        selectedColor: Colors.white,
                        selectedTileColor: Colors.blueGrey,
                        leading: const FlutterLogo(),
                        title:
                            Text(context.read<ProcessBloc>().processes[2].name),
                        onTap: () => {
                          context.read<ProcessBloc>().add(SelectProcessEvent(
                              context.read<ProcessBloc>().processes[2])),
                          Navigator.pop(context),
                        },
                      ),
                    ),
                  ]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            child: WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(
                      child: const Center(child: Text("Hi")),
                    ),
                  ),
                  MinimizeWindowButton(
                    colors: WindowButtonColors(normal: Colors.green),
                  ),
                  MaximizeWindowButton(
                    colors: WindowButtonColors(normal: Colors.green),
                  ),
                  CloseWindowButton(
                    colors: WindowButtonColors(
                        normal: Colors.green, mouseOver: Colors.redAccent),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ScanBloc, ScanState>(
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
                    Container(
                      alignment: AlignmentDirectional.topCenter,
                      color: Colors.blueGrey,
                      width: 250,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
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
                            items: context
                                .read<ScanBloc>()
                                .dataTypes
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: BlocBuilder<HexBloc, HexState>(
                          builder: (context, state) {
                        return Expanded(
                            child: Container(
                          color: Colors.brown,
                          child: StickyHeadersTable(
                            initialScrollOffsetX: _scrollOffsetX,
                            initialScrollOffsetY: _scrollOffsetY,
                            onEndScrolling: (scrollOffsetX, scrollOffsetY) {
                              _scrollOffsetX = scrollOffsetX;
                              _scrollOffsetY = scrollOffsetY;
                            },
                            columnsLength: 4,
                            rowsLength: 4,
                            columnsTitleBuilder: (int columnIndex) {
                              // TODO: Build columns
                            },
                            rowsTitleBuilder: (int rowIndex) {
                              // TODO: Build rows
                            },
                            contentCellBuilder:
                                (int columnIndex, int rowIndex) {
                              // TODO: Build cells
                                },
                          ),
                        ));
                      }),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ** Temporary variables for testing ** //
double _scrollOffsetX = 0.0;
double _scrollOffsetY = 0.0;
