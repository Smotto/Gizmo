import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmo/home/bloc/home_bloc.dart';
import 'package:gizmo/models/process.dart';
import '../theme/cubit/theme_cubit.dart';

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
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          WindowTitleBarBox(
            child: MoveWindow(),
          ),
          IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          }),
          IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          }),
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
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView(
                    children: [
                      Card(
                        child: ListTile(
                          selected: context.read<HomeBloc>().processes[0].isActive,
                          selectedColor: Colors.white,
                          selectedTileColor: Colors.blueGrey,
                          leading: const FlutterLogo(),
                          title: Text(context.read<HomeBloc>().processes[0].name),
                          onTap: () => {
                            context.read<HomeBloc>().add(SelectProcessEvent(context.read<HomeBloc>().processes[0])),
                            // Navigator.pop(context),
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          selected: context.read<HomeBloc>().processes[1].isActive,
                          selectedColor: Colors.white,
                          selectedTileColor: Colors.blueGrey,
                          leading: const FlutterLogo(),
                          title: Text(context.read<HomeBloc>().processes[1].name),
                          onTap: () => {
                            context.read<HomeBloc>().add(SelectProcessEvent(context.read<HomeBloc>().processes[1])),
                            // Navigator.pop(context),
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          selected: context.read<HomeBloc>().processes[2].isActive,
                          selectedColor: Colors.white,
                          selectedTileColor: Colors.blueGrey,
                          leading: const FlutterLogo(),
                          title: Text(context.read<HomeBloc>().processes[2].name),
                          onTap: () => {
                            context.read<HomeBloc>().add(SelectProcessEvent(context.read<HomeBloc>().processes[2])),
                            // Navigator.pop(context),
                          },
                        ),
                      ),
                    ]
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
