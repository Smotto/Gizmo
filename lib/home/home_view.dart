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
                    icon: const Icon(Icons.bug_report_rounded,
                        color: Colors.redAccent),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: MoveWindow(
                          child: const Center(
                              child: Text("Current attached Process")),
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
               const LinearProgressIndicator(
                  backgroundColor: Colors.blueGrey,
                  color: Colors.lightBlueAccent,
                  value: null,
                  semanticsLabel: 'Circular progress indicator',
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