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

class ManualScanEvent extends ScanEvent {
  const ManualScanEvent(this.scanValue);
  final String scanValue;

  @override
  List<Object> get props => [scanValue];
}

