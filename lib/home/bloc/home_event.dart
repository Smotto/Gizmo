part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectProcessEvent extends HomeEvent {
  const SelectProcessEvent(this.selectedProcess);
  final Process selectedProcess;

  @override
  List<Object> get props => [selectedProcess];
}