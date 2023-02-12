import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:gizmo_engine/gizmo_engine.dart';

part 'process_event.dart';

part 'process_state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  Color plugIconColor = Colors.grey;
  Process? selectedProcess;
  HashSet<Process> processes = HashSet();

  ProcessBloc() : super(ProcessInitial()) {
    on<OpenDrawerEvent>(_dealWithOpenDrawerEvent);
    on<SelectProcessEvent>(_dealWithSelectProcessEvent);
  }

  FutureOr<void> _dealWithOpenDrawerEvent(OpenDrawerEvent event, Emitter<ProcessState> emit) {
    ProcessHandler.updateProcesses(processes);

    _checkIfProcessIsAlive(event, emit);

    emit(const AllProcessesRefreshed());
  }

  FutureOr<void> _dealWithSelectProcessEvent(SelectProcessEvent event, Emitter<ProcessState> emit) {
    if (selectedProcess?.isActive == true && selectedProcess == event.selectedProcess) {
      selectedProcess?.isActive = false;
      plugIconColor = Colors.grey;
      emit(ProcessDeselectedState(selectedProcess));
    } else {
      selectedProcess?.isActive = false;
      selectedProcess = event.selectedProcess;
      selectedProcess?.isActive ^= true;
      plugIconColor = Colors.lightGreenAccent;
      emit(ProcessSelectedState(selectedProcess));
    }
  }

  FutureOr<void> _checkIfProcessIsAlive(OpenDrawerEvent event, Emitter<ProcessState> emit) {
    if (!ProcessHandler.isProcessAlive(processes, selectedProcess)) {
      selectedProcess?.isActive = false;
      plugIconColor = Colors.grey;
      emit(ProcessDeselectedState(selectedProcess));
    }
  }
}
