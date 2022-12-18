import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmo/home/bloc/home_bloc.dart';
import '../theme/cubit/theme_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      width: 200,
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
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          selected: true,
                          selectedColor: Colors.white,
                          selectedTileColor: Colors.blueGrey,
                          leading: const FlutterLogo(),
                          title: Text('${context.read<HomeBloc>().selectedProcess}'),
                          onTap: () => {
                            context.read<HomeBloc>().add(const SelectedProcessEvent("Squally"))
                          },
                        ),
                      ),
                    ],
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
