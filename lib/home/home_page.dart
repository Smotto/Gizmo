import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';

import 'home_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] that:
/// * provides a [HomeBloc] to the [HomeView].
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

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
      ],
      child: const HomeView(),
    );
  }
}