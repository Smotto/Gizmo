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
  }

  FutureOr<void> _selectDataTypeHandler (SelectDataTypeEvent event, Emitter<ScanState> emit) {
    selectedDataType = event.selectedDataType;
    emit(DataTypeSelected(selectedDataType));
  }
}
