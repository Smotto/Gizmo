part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();
}

class ScanInitial extends ScanState {
  @override
  List<Object> get props => [];
}
