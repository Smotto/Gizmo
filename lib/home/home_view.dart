import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmo/models/process.dart';
import '../theme/cubit/theme_cubit.dart';
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
      child: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
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
            BlocBuilder<ScanBloc, ScanState>(
              builder: (context, state) {
                return Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                          sortColumnIndex: 0,
                          sortAscending: true,
                          columns: const [
                            DataColumn(label: Text("Address")),
                            DataColumn(label: Text("Value"), numeric: true),
                            DataColumn(label: Text("Previous Value"), numeric: true),
                            DataColumn(label: Text("Label")),
                          ],
                          rows: const [
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
