part of 'process_bloc.dart';

@immutable
abstract class ProcessState extends Equatable{
  const ProcessState();
}

class ProcessInitial extends ProcessState {
  @override
  List<Object> get props => [];
}

class ProcessSelectedState extends ProcessState {
  const ProcessSelectedState(this.selectedProcess);
  final Process? selectedProcess;

  @override
  List<Object?> get props => [selectedProcess];
}

class ProcessDeselectedState extends ProcessState {
  const ProcessDeselectedState(this.selectedProcess);
  final Process? selectedProcess;

  @override
  List<Object?> get props => [selectedProcess];
}