part of 'project_bloc.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();
}

class ProjectInitial extends ProjectState {
  @override
  List<Object> get props => [];
}
