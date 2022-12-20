import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:gizmo/models/process.dart';

part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  Color plugIconColor = Colors.grey;
  Process? selectedProcess;
  List<Process> processes = [
    Process("Squally", 3, false),
    Process("Notepad", 41, false),
    Process("Discord", 72, false)];

  ProcessBloc() : super(ProcessInitial()) {
    on<SelectProcessEvent>(_dealWithSelectProcessEvent);
  }

  FutureOr<void> _dealWithSelectProcessEvent (SelectProcessEvent event, Emitter<ProcessState> emit) {
    if (selectedProcess?.isActive == true && selectedProcess == event.selectedProcess)
    {
      selectedProcess?.isActive = false;
      plugIconColor = Colors.grey;
      emit(ProcessDeselectedState(selectedProcess));
    }
    else {
      selectedProcess?.isActive = false;
      selectedProcess = event.selectedProcess;
      selectedProcess?.isActive ^= true;
      plugIconColor = Colors.lightGreenAccent;
      emit(ProcessSelectedState(selectedProcess));
    }
  }
}


