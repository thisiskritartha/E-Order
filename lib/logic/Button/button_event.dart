part of 'button_bloc.dart';

abstract class ButtonEvent extends Equatable {
  const ButtonEvent();

  @override
  List<Object> get props => [];
}

class ButtonPressed extends ButtonEvent {
  final Future<void> Function() onPressed;
  const ButtonPressed({required this.onPressed});

  @override
  List<Object> get props => [onPressed];
}
