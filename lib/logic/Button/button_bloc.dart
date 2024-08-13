import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitial()) {
    on<ButtonPressed>((event, emit) async {
      emit(ButtonLoading());
      try {
        await event.onPressed();
        emit(ButtonSuccess());
      } catch (_) {
        emit(ButtonFailure());
      }
    });
  }
}
