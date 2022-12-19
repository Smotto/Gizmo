part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class ProcessSelectedState extends HomeState {
  ProcessSelectedState(this.selectedProcess);
  final Process? selectedProcess;

  @override
  List<Object?> get props => [selectedProcess];
}

class ProcessDeselectedState extends HomeState {
  ProcessDeselectedState(this.selectedProcess);
  final Process? selectedProcess;

  @override
  List<Object?> get props => [selectedProcess];
}
