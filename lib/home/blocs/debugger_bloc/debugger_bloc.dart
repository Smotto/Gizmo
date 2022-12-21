import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'debugger_event.dart';
part 'debugger_state.dart';

class DebuggerBloc extends Bloc<DebuggerEvent, DebuggerState> {
  DebuggerBloc() : super(DebuggerInitial()) {
    on<DebuggerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
