part of 'process_bloc.dart';

@immutable
abstract class ProcessEvent extends Equatable{
  const ProcessEvent();
}

class SelectProcessEvent extends ProcessEvent {
  const SelectProcessEvent(this.selectedProcess);
  final Process selectedProcess;

  @override
  List<Object> get props => [selectedProcess];
}

class OpenDrawerEvent extends ProcessEvent {
  const OpenDrawerEvent();

  @override
  List<Object> get props => [];
}
