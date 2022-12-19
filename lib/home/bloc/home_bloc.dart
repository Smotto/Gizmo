import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gizmo/models/process.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Process? selectedProcess;
  List<Process> processes = [
    Process("Squally", 3, false),
    Process("Notepad", 41, false),
    Process("Discord", 72, false)];

  HomeBloc() : super(HomeInitial()) {
    on<SelectProcessEvent>(_dealWithSelectProcessEvent);
  }

  FutureOr<void> _dealWithSelectProcessEvent (SelectProcessEvent event, Emitter<HomeState> emit) {
    if (selectedProcess?.isActive == true && selectedProcess == event.selectedProcess)
      {
        selectedProcess?.isActive = false;
        emit(ProcessDeselectedState(selectedProcess));
      }
    else {
      selectedProcess?.isActive = false;
      selectedProcess = event.selectedProcess;
      selectedProcess?.isActive ^= true;
      emit(ProcessSelectedState(selectedProcess));
    }
  }

}
