part of 'debugger_bloc.dart';

abstract class DebuggerState extends Equatable {
  const DebuggerState();
}

class DebuggerInitial extends DebuggerState {
  @override
  List<Object> get props => [];
}
