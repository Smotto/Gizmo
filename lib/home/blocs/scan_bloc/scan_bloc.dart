import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gizmo/home/blocs/blocs.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  List<String> dataTypes = <String>['Integer', 'Float', 'Double', 'Byte'];
  String selectedDataType = 'Integer';

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

      // TODO: Implement scanning on map of addresses
      await Future.delayed(const Duration(seconds: 1));

      emit(ScanComplete(event.scanValue));
    }
  }
}
