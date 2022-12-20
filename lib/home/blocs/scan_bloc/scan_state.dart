part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();
}

class ScanInitial extends ScanState {
  @override
  List<Object> get props => [];
}

class DataTypeSelected extends ScanState {
  const DataTypeSelected(this.selectedDataType);
  final String? selectedDataType;

  @override
  List<Object?> get props => [selectedDataType];
}