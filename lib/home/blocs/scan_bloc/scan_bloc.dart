import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gizmo/home/blocs/blocs.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  String selectedDataType = 'Integer';
  double progressValue = 0.0;

  ScanBloc() : super(ScanInitial()) {
    on<SelectDataTypeEvent>(_selectDataTypeHandler);
    on<ManualScanEvent>(_manualScanHandler);
  }

  FutureOr<void> _selectDataTypeHandler(
      SelectDataTypeEvent event, Emitter<ScanState> emit) {
    selectedDataType = event.selectedDataType;
    emit(DataTypeSelected(selectedDataType));
  }

  FutureOr<void> _manualScanHandler(
      ManualScanEvent event, Emitter<ScanState> emit) async {
    if (event.scanValue.isNotEmpty) {
      emit(Scanning(event.scanValue));
      progressValue = 0.9;
      // TODO: Implement scanning on map of addresses
      await Future.delayed(const Duration(milliseconds: 500));
      emit(ScanComplete(event.scanValue));
      progressValue = 0;
    }
  }
}
