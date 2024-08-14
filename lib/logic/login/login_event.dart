part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {}

final class LoginEmailChanged extends LoginEvent {
  final String email;

  LoginEmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

final class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

final class LoginSubmitted extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class TogglePasswordVisibility extends LoginEvent {
  @override
  List<Object?> get props => [];
}
