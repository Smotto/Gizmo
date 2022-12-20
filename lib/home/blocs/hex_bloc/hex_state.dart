part of 'hex_bloc.dart';

abstract class HexState extends Equatable {
  const HexState();
}

class HexInitial extends HexState {
  @override
  List<Object> get props => [];
}
