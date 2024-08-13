part of 'button_bloc.dart';

abstract class ButtonState extends Equatable {
  const ButtonState();

  @override
  List<Object> get props => [];
}

class ButtonInitial extends ButtonState {}

class ButtonLoading extends ButtonState {}

class ButtonSuccess extends ButtonState {}

class ButtonFailure extends ButtonState {}
