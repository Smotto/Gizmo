import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  String? selectedProcess = "";

  HomeBloc() : super(HomeInitial()) {
    on<SelectedProcessEvent>(_dealWithSelectProcessEvent);
  }

  FutureOr<void> _dealWithSelectProcessEvent (SelectedProcessEvent event, Emitter<HomeState> emit) {
    selectedProcess = event.processName;
    emit(ProcessSelectedState(selectedProcess));
  }
}
