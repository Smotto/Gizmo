import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmo/home/bloc/home_bloc.dart';

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
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: const HomeView(),
      );
  }
}