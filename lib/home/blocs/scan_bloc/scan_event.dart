part of 'scan_bloc.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();
}

class SelectDataTypeEvent extends ScanEvent {
  const SelectDataTypeEvent(this.selectedDataType);
  final String selectedDataType;

  @override
  List<Object> get props => [selectedDataType];
}

