import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmo/home/scanning/scan_view.dart';
import 'package:gizmo/models/process.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';
import '../theme/cubit/theme_cubit.dart';
import 'blocs/blocs.dart';
import 'drawer.dart';

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
          LeftHackerMenu(),
          RightSide(),
        ],
      ),
    );
  }
}

class LeftHackerMenu extends StatelessWidget {
  const LeftHackerMenu({super.key});

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
                  highlightColor: Colors.lightGreenAccent,
                  icon: Icon(Icons.electrical_services_sharp, color: context.read<ProcessBloc>().plugIconColor),
                  onPressed: () {
                    context.read<ProcessBloc>().add(const OpenDrawerEvent());
                    _scaffoldKey.currentState?.openDrawer();
                  });
            },
          ),
          BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              return IconButton(
                  highlightColor: Colors.lightBlueAccent,
                  icon: const Icon(Icons.folder, color: Colors.lightBlueAccent),
                  onPressed: () {});
            },
          ),
          BlocBuilder<DebuggerBloc, DebuggerState>(
            builder: (context, state) {
              return Hero(
                tag: "debugger",
                child: IconButton(
                    highlightColor: Colors.redAccent,
                    icon: const Icon(Icons.bug_report_rounded, color: Colors.redAccent),
                    onPressed: () {}),
              );
            },
          ),
        ],
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
            color: Colors.black12,
            child: Column(
              children: [
                WindowTitleBarBox(
                  child: Stack(
                    children: [
                      BlocBuilder<ProcessBloc, ProcessState>(
                        builder: (context, state) {
                          if (state is ProcessSelectedState) {
                            return Align(
                              child: MoveWindow(
                                child: Center(child: Text(
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                    context.read<ProcessBloc>().selectedProcess!.name)),
                              ),
                            );
                          }
                          else if (state is ProcessDeselectedState) {
                            return Align(
                              child: MoveWindow(
                                child: const Center(child: Text(
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                    "No process selected.")),
                              ),
                            );
                          }
                          else if (state is AllProcessesRefreshed && context.read<ProcessBloc>().selectedProcess!.isActive) {
                            return Align(
                              child: MoveWindow(
                                child: Center(child: Text(
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                    context.read<ProcessBloc>().selectedProcess!.name)),
                              ),
                            );
                          }
                          else {
                            return Align(
                              child: MoveWindow(
                                child: const Center(child: Text(
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                    "No process selected.")),
                              ),
                            );
                          }
                        },
                      ),
                      Positioned(
                        right: 92,
                        child: MinimizeWindowButton(
                          colors: WindowButtonColors(normal: Colors.green),
                        ),
                      ),
                      Positioned(
                        right: 46,
                        child: MaximizeWindowButton(
                          colors: WindowButtonColors(normal: Colors.green),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: CloseWindowButton(
                          colors: WindowButtonColors(normal: Colors.green, mouseOver: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ScanBloc, ScanState>(
                  builder: (context, state) {
                    return LinearProgressIndicator(
                      backgroundColor: Colors.blueGrey,
                      color: Colors.lightBlueAccent,
                      value: context.read<ScanBloc>().progressValue,
                      semanticsLabel: 'Circular progress indicator',
                    );
                  },
                ),
              ],
            ),
          ),
          const ScanView()
        ],
      ),
    );
  }
}
