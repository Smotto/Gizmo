import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hex_event.dart';
part 'hex_state.dart';

class HexBloc extends Bloc<HexEvent, HexState> {
  HexBloc() : super(HexInitial()) {
    on<HexEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
