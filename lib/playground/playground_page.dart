import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmo/home/blocs/blocs.dart';

import 'playground_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] that:
/// * provides a [HomeBloc] to the [PlaygroundView].
/// {@endtemplate}
class PlaygroundPage extends StatelessWidget {
  /// {@macro home_page}
  const PlaygroundPage({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: PlaygroundPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
        BlocProvider<ProcessBloc>(
          create: (BuildContext context) => ProcessBloc(),
        ),
        BlocProvider<ScanBloc>(
          create: (BuildContext context) => ScanBloc(),
        ),
        BlocProvider<ProjectBloc>(
          create: (BuildContext context) => ProjectBloc(),
        ),
        BlocProvider<HexBloc>(
          create: (BuildContext context) => HexBloc(),
        ),
        BlocProvider<DebuggerBloc>(
          create: (BuildContext context) => DebuggerBloc(),
        )
      ],
      child: const PlaygroundView(),
    );
  }
}