part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectedProcessEvent extends HomeEvent {
  const SelectedProcessEvent(this.processName);
  final String processName;

  @override
  List<Object> get props => [processName];
}
