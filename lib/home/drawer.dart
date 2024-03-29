import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'blocs/blocs.dart';

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
                    child: ListView.builder(
                  itemCount: context.read<ProcessBloc>().processes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        selected: context.read<ProcessBloc>().processes.elementAt(index).isActive,
                        selectedColor: Colors.white,
                        selectedTileColor: Colors.blueGrey,
                        leading: const FlutterLogo(),
                        title: Text(context.read<ProcessBloc>().processes.elementAt(index).name),
                        onTap: () => {
                          context
                              .read<ProcessBloc>()
                              .add(SelectProcessEvent(context.read<ProcessBloc>().processes.elementAt(index))),
                          Navigator.pop(context),
                        },
                      ),
                    );
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
