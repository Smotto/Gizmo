part of 'process_bloc.dart';

@immutable
abstract class ProcessState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProcessInitial extends ProcessState {}

class ProcessSelectedState extends ProcessState {
  ProcessSelectedState(this.selectedProcess);
  final Process? selectedProcess;

  @override
  List<Object?> get props => [selectedProcess];
}

class ProcessDeselectedState extends ProcessState {
  ProcessDeselectedState(this.selectedProcess);
  final Process? selectedProcess;

  @override
  List<Object?> get props => [selectedProcess];
}